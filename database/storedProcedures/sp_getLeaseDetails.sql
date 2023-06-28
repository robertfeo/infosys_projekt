CREATE PROCEDURE db_owner.Group2_SS2023_sp_getLeaseDetails
    @lease_id INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1
    FROM db_owner.Group2_SS2023_Lease
    WHERE id = @lease_id)      BEGIN
        PRINT 'The specified lease does not exist.'
        RETURN
    END
    SELECT L.id AS lease_id, L.startDate, L.endDate, L.rentAmount, P.street, P.city, P.zip, U.id AS unit_id, U.apartNo, U.size, L.nrResidents, T.name AS tenantName
    FROM db_owner.Group2_SS2023_Lease L INNER JOIN db_owner.Group2_SS2023_Unit U ON L.unit_id = U.id INNER JOIN db_owner.Group2_SS2023_Property P ON U.property_id = P.id INNER JOIN db_owner.Group2_SS2023_Tenant T ON L.tenant_id = T.id
    WHERE L.id = @lease_id
END