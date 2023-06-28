ALTER PROCEDURE [db_owner].[Group2_SS2023_sp_getLeasesOfUnit]
    @unit_id INT
AS
BEGIN
    SELECT
        L.id as lease_id,
        L.startDate,
        L.endDate,
        L.rentAmount,
        L.nrResidents,
        T.name AS tenantName
    FROM db_owner.Group2_SS2023_Lease L
        INNER JOIN db_owner.Group2_SS2023_Tenant T ON L.tenant_id = T.id
    WHERE L.unit_id = @unit_id;
END;