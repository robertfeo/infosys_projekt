ALTER PROCEDURE [db_owner].[Group2_SS2023_sp_getScsDetails]
    @scs_id NVARCHAR(50)
AS
BEGIN
    DECLARE @year INT, @lease_id INT;
    
    -- Extract year and lease_id from scs_id
    SET @year = CAST(SUBSTRING(@scs_id, 1, CHARINDEX('-', @scs_id) - 1) AS INT);
    SET @lease_id = CAST(SUBSTRING(@scs_id, CHARINDEX('-', @scs_id) + 1, LEN(@scs_id)) AS INT);

    SELECT 
        l.id as lease_id, 
        p.street, 
        p.city, 
        p.zip, 
        u.apartNo, 
        u.size, 
        l.nrResidents, 
        t.name as tenantName
    FROM db_owner.Group2_SS2023_GeneralLedger AS g
    JOIN db_owner.Group2_SS2023_ServiceCharge AS s ON g.id = s.generalLedger_id
    JOIN db_owner.Group2_SS2023_Lease AS l ON s.lease_id = l.id
    JOIN db_owner.Group2_SS2023_Tenant AS t ON t.id = l.tenant_id
    JOIN db_owner.Group2_SS2023_Unit AS u ON u.id = l.unit_id
    JOIN db_owner.Group2_SS2023_Property AS p ON p.id = u.property_id
    WHERE l.id = @lease_id AND YEAR(g.bookingDay) = @year;
END