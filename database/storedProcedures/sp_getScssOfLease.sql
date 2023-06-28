ALTER PROCEDURE [db_owner].[Group2_SS2023_sp_getScssOfLease]
    @lease_id INT
AS 
SELECT CONCAT(YEAR(g.bookingDay),'-', l.id) as scs_id, YEAR(g.bookingDay) as year, SUM(g.payment) as totalAmount, l.id as lease_id, t.name as tenantName
FROM db_owner.Group2_SS2023_GeneralLedger as g
    JOIN db_owner.Group2_SS2023_ServiceCharge as s
    ON g.id = s.generalLedger_id
    JOIN db_owner.Group2_SS2023_Lease as l
    ON s.lease_id = l.id
    JOIN db_owner.Group2_SS2023_Tenant as t
    ON t.id = l.tenant_id
WHERE l.id = @lease_id
GROUP BY YEAR(g.bookingDay), l.id, t.name