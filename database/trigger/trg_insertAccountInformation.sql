CREATE TRIGGER [db_owner].[trg_insertAccountInformation]
ON [db_owner].[Group2_SS2023_Staging]
AFTER INSERT 
AS 
BEGIN 
	DECLARE @purpose VARCHAR(20);
	DECLARE @payment FLOAT; 
	DECLARE @bookingDay DATE;
	DECLARE @payer VARCHAR(50);
	SELECT @payment = payment, @bookingDay = bookingDay, @purpose = purpose, @payer = payer FROM inserted 
	DECLARE @unitId INT;
	DECLARE @leaseId INT;

	IF CHARINDEX('MIETE', @purpose) > 0 
	-- Miete hat seperate route
	BEGIN 
			-- Get the last rent difference by tenant to calulcate new rent difference
	DECLARE @rentAmount FLOAT 
	SELECT @leaseId = id, @unitId = unit_id, @rentAmount = rentAmount FROM Group2_SS2023_Lease WHERE unit_id = (
	SELECT id from Group2_SS2023_Tenant where name = @payer)
	DECLARE @lastRentDifference FLOAT; 
	SELECT TOP 1 @lastRentDifference = rentDifference FROM Group2_SS2023_Rent WHERE lease_id = @leaseId ORDER BY id DESC 
		--PRINT 'MIETE part'
		--WHILE (@payment >= @rentAmount)
		--BEGIN 
			--PRINT('while')
			--PRINT('Uebriges Payment: ' + cast(@payment as varchar) )
			INSERT INTO Group2_SS2023_GeneralLedger VALUES (NULL, @payment, @bookingDay, @purpose, @payer)
			IF @lastRentDifference IS NULL 
				BEGIN 
					INSERT INTO Group2_SS2023_Rent VALUES (@leaseId, SCOPE_IDENTITY(), @rentAmount, (@payment - @rentAmount));-- scope_identity gets last insert identity(id) value
				END 
			ELSE 
				BEGIN 
					INSERT INTO Group2_SS2023_Rent VALUES (@leaseId, SCOPE_IDENTITY(), @rentAmount, (@lastRentDifference - @rentAmount + @payment));-- scope_identity gets last insert identity(id) value
				END 
			--SET @payment = @payment - @rentAmount
		--END 
		-- rest zahlung als seperate general ledger und rent zahlungen
		--INSERT INTO Group2_SS2023_GeneralLedger VALUES (@payment, GETDATE(), @purpose, @payer)
		--INSERT INTO Group2_SS2023_Rent VALUES (@leaseId, SCOPE_IDENTITY());-- scope_identity gets last insert identity(id) value	
	END 
	ELSE 
	BEGIN  
		PRINT 'ELSE part'

		--select @serviceContractId = sc.id, @unitId = sc.unit_id, @distributionKey = .distributionKey from Group2_SS2023_ServiceContract as sc
		--join Group2_SS2023_ServiceType as st 
		--on sc.serviceType_id = st.id

		-- get distribution key 
		DECLARE @distributionKey VARCHAR(20), @serviceContractId INT;
		select @serviceContractId = sc.id, @unitId = sc.unit_id, @distributionKey = st.distributionKey from Group2_SS2023_ServiceContract as sc
		join Group2_SS2023_ServiceType as st 
		on sc.serviceType_id = st.id
		where sc.number = @purpose
		-- insert into generalLedger
		INSERT INTO Group2_SS2023_GeneralLedger (payment, bookingDay, purpose, payer, serviceContract_id) VALUES (@payment, @bookingDay, @purpose, @payer, @serviceContractId)
		DECLARE @generalLedgerId INT = IDENT_CURRENT('Group2_SS2023_GeneralLedger')
		-- get property id 
		DECLARE @propertyId INT; 
		select @propertyId = p.id from Group2_SS2023_Property as p
		join Group2_SS2023_Unit as u
		on p.id = u.property_id AND u.id = 1 
		IF @distributionKey = 'Person' 
		BEGIN 
			-- get residents amount in property
			DECLARE @residentsInProperty INT; 
			select @residentsInProperty = SUM(l.nrResidents) from Group2_SS2023_Property as p 
			join Group2_SS2023_Unit as u 
			on p.id = u.property_id
			join Group2_SS2023_Lease as l
			on u.id = l.unit_id
			where p.id = @propertyId
			-- insert calculated values into service charge
			insert into Group2_SS2023_ServiceCharge (lease_id, generalLedger_id, payment)
			select l.id, @generalLedgerId, (cast(l.nrResidents as float)/cast(@residentsInProperty as float) * cast(@payment as float)) from Group2_SS2023_Property as p 
			join Group2_SS2023_Unit as u 
			on p.id = u.property_id
			join Group2_SS2023_Lease as l
			on u.id = l.unit_id
			where p.id = @propertyId
		END 

		IF @distributionKey = 'Behälter' 
		-- pro wohnung
		BEGIN 
			-- get amount of units in property
			DECLARE @amountUnitsInProperty INT; 
			select @amountUnitsInProperty = COUNT(u.id) from Group2_SS2023_Property as p 
			join Group2_SS2023_Unit as u 
			on p.id = u.property_id
			join Group2_SS2023_Lease as l
			on u.id = l.unit_id
			where p.id = @propertyId
			-- insert calculated values into service charge
			insert into Group2_SS2023_ServiceCharge (lease_id, generalLedger_id, payment)
			select l.id, @generalLedgerId, (cast(1 as float)/cast(@amountUnitsInProperty as float) * cast(@payment as float)) from Group2_SS2023_Property as p 
			join Group2_SS2023_Unit as u 
			on p.id = u.property_id
			join Group2_SS2023_Lease as l
			on u.id = l.unit_id
			where p.id = @propertyId
		END 
		
		IF @distributionKey = 'Wohnfläche' 
		BEGIN 
			DECLARE @sizeOfProperty INT; 
			select @sizeOfProperty = SUM(u.size) from Group2_SS2023_Property as p 
			join Group2_SS2023_Unit as u 
			on p.id = u.property_id
			join Group2_SS2023_Lease as l
			on u.id = l.unit_id
			where p.id = @propertyId
			-- insert calculated values into service charge
			insert into Group2_SS2023_ServiceCharge (lease_id, generalLedger_id, payment)
			select l.id, @generalLedgerId, (cast(u.size as float)/cast(@sizeOfProperty as float) * cast(@payment as float)) from Group2_SS2023_Property as p 
			join Group2_SS2023_Unit as u 
			on p.id = u.property_id
			join Group2_SS2023_Lease as l
			on u.id = l.unit_id
			where p.id = @propertyId
		END 
		
		IF @distributionKey = 'Einzelabrechnung' 
		BEGIN 
			INSERT INTO Group2_SS2023_ServiceCharge VALUES (@leaseId, @generalLedgerId, @payment)
		END 

	END
	DELETE FROM Group2_SS2023_Staging
END
