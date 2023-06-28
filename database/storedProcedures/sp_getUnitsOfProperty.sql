ALTER PROCEDURE [db_owner].[sp_getUnitsOfProperty]
    @Property_id INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1
    FROM db_owner.Group2_SS2023_Unit
    WHERE property_id = @Property_id)
  BEGIN
        PRINT 'No units found for the provided property_id';
        RETURN;
    END

    SELECT id as unit_id, apartNo, size
    FROM db_owner.Group2_SS2023_Unit
    WHERE property_id = @Property_id
END