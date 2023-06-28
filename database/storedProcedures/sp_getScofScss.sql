ALTER PROCEDURE [db_owner].[Group2_SS2023_sp_getScofScss]
    @Scs_id NVARCHAR(255)
AS
BEGIN
    -- Split Scs_id into year and lease_id
    DECLARE @Year INT, @LeaseId INT;
    SET @Year = CAST(LEFT(@Scs_id, 4) AS INT);
    SET @LeaseId = CAST(RIGHT(@Scs_id, LEN(@Scs_id) - 5) AS INT);

    -- Fetch all service charges for the lease within the given year
    SELECT 
        ServiceCharge.id AS Id,
        GeneralLedger.bookingDay AS Date,
        ServiceCharge.payment AS Amount,
        ServiceType.type AS Type,
        ServiceProvider.name AS ServiceProvider
    FROM 
		[db_owner].[Group2_SS2023_GeneralLedger] GeneralLedger
        INNER JOIN [db_owner].[Group2_SS2023_ServiceContract] ServiceContract ON GeneralLedger.serviceContract_id = ServiceContract.id
        INNER JOIN [db_owner].[Group2_SS2023_ServiceProvider] ServiceProvider ON ServiceContract.provider_id = ServiceProvider.id
        INNER JOIN [db_owner].[Group2_SS2023_ServiceType] ServiceType ON ServiceContract.serviceType_id = ServiceType.id
        INNER JOIN [db_owner].[Group2_SS2023_ServiceCharge] ServiceCharge ON ServiceCharge.generalLedger_id = GeneralLedger.id
    WHERE 
        ServiceCharge.lease_id = @LeaseId
        AND YEAR(GeneralLedger.bookingDay) = @Year
END;
