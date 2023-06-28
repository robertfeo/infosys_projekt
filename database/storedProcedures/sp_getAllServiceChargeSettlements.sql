ALTER PROCEDURE [db_owner].[sp_getAllServiceChargeSettlements]  
AS 
SELECT 
	CONCAT(CAST(YEAR(g.bookingDay) AS VARCHAR(4)), '-', CAST(l.id AS VARCHAR(10))) as scs_id,
	YEAR(g.bookingDay) as year,
	SUM(s.payment) as totalAmount,
	l.id as lease_id,
	p.street,
	p.city,
	p.zip,
	t.name
FROM Group2_SS2023_GeneralLedger as g 
    JOIN Group2_SS2023_ServiceCharge as s 
    ON g.id = s.generalLedger_id
    JOIN Group2_SS2023_Lease as l 
    ON s.lease_id = l.id
    JOIN Group2_SS2023_Unit as u 
    ON l.unit_id = u.id 
    JOIN Group2_SS2023_Property as p 
    ON p.id = u.property_id
    JOIN Group2_SS2023_Tenant as t 
    ON t.id = l.tenant_id
GROUP BY YEAR(g.bookingDay), l.id, p.street, p.city, p.zip, t.name
