CREATE PROCEDURE db_owner.Group2_SS2023_sp_getAllProperties
AS
BEGIN
    SELECT p.id, p.street, p.city, p.zip, o.name AS ownerName
    FROM [db_owner].[Group2_SS2023_Property] p INNER JOIN [db_owner].[Group2_SS2023_Owner] o ON p.owner_id = o.id;
END; 