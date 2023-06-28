ALTER PROCEDURE [db_owner].[Group2_SS2023_sp_getRentForUnit]
    @unit_id INT
AS
BEGIN
    WITH
        Months(Month)
        AS
        (
                            SELECT MIN(startDate) as Month
                FROM [db_owner].[Group2_SS2023_Lease]
                WHERE unit_id = @unit_id
            UNION ALL
                SELECT DATEADD(month, 1, Month)
                FROM Months
                WHERE Month < GETDATE()
        ),
        Payments
        AS
        (
            SELECT
                FORMAT(m.Month, 'MM-yyyy') as [month],
                T.name as tenantName,
                MAX(L.rentAmount) as rent,
                ISNULL(SUM(GL.payment), 0) as payedRent
            FROM
                Months m
                LEFT JOIN
                [db_owner].[Group2_SS2023_Lease] L on L.unit_id = @unit_id AND m.Month >= L.startDate AND m.Month <= L.endDate
                LEFT JOIN
                [db_owner].[Group2_SS2023_Tenant] T on L.tenant_id = T.id
                LEFT JOIN
                [db_owner].[Group2_SS2023_Rent] R on L.id = R.lease_id
                LEFT JOIN
                [db_owner].[Group2_SS2023_GeneralLedger] GL on R.generalLedger_id = GL.id AND YEAR(m.Month) = YEAR(GL.bookingDay) AND MONTH(m.Month) = MONTH(GL.bookingDay)
            GROUP BY
            FORMAT(m.Month, 'MM-yyyy'),
            T.name
        )
    SELECT
        P.month,
        P.tenantName,
        P.rent,
        P.payedRent
    FROM Payments P
    ORDER BY
        SUBSTRING(P.month, 4, 7), -- Order by Year
        SUBSTRING(P.month, 1, 2);
-- Then by Month
END;
