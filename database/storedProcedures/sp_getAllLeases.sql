CREATE PROCEDURE db_owner.Group2_SS2023_sp_getAllLeases
AS
BEGIN
    SELECT L.id, L.startDate, L.endDate, L.rentAmount, P.street, P.city, P.zip, U.apartNo, T.name as tenantName, L.nrResidents
    FROM db_owner.Group2_SS2023_Lease L INNER JOIN db_owner.Group2_SS2023_Unit U ON L.unit_id = U.id INNER JOIN db_owner.Group2_SS2023_Property P ON U.property_id = P.id INNER JOIN db_owner.Group2_SS2023_Tenant T ON L.tenant_id = T.id
END