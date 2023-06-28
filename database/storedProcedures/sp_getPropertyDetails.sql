ALTER PROCEDURE [db_owner].[sp_getPropertyDetails]
    @property_id INT
AS
BEGIN
    SELECT P.id, P.street, P.city, P.zip, O.name AS ownerName, O.street AS ownerStreet, O.city AS ownerCity, O.zip AS ownerZip
    FROM db_owner.Group2_SS2023_Property P
        INNER JOIN db_owner.Group2_SS2023_Owner O ON P.owner_id = O.id
    WHERE P.id = @property_id;
END;