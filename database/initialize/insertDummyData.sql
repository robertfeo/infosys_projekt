-- Owner
SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Owner] ON;
INSERT INTO [Infosys].[db_owner].[Group2_SS2023_Owner] ([id], [name], [street], [city], [zip])
VALUES (1, 'Thomas Müller', 'Plochinger Straße 123', 'Esslingen', '73730');
SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Owner] OFF;

SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Owner] ON;
INSERT INTO [Infosys].[db_owner].[Group2_SS2023_Owner] ([id], [name], [street], [city], [zip])
VALUES (2, 'Gabi Maier', 'Hirschlandstraße 22', 'Esslingen', '73730');
SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Owner] OFF;

-- Property
SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Property] ON;
INSERT INTO [Infosys].[db_owner].[Group2_SS2023_Property] ([id], [owner_id], [street], [city], [zip])
VALUES (1, 1, 'Flandernstr. 101', 'Esslingen', '73732');
SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Property] OFF;

SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Property] ON;
INSERT INTO [Infosys].[db_owner].[Group2_SS2023_Property] ([id], [owner_id], [street], [city], [zip])
VALUES (2, 2, 'Ulmer Straße 10', 'Esslingen', '73730');
SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Property] OFF;

-- Unit
SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Unit] ON;
INSERT INTO [Infosys].[db_owner].[Group2_SS2023_Unit] ([id], [property_id], [apartNo], [size])
VALUES (1, 1, 1, 100);
SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Unit] OFF;

SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Unit] ON;
INSERT INTO [Infosys].[db_owner].[Group2_SS2023_Unit] ([id], [property_id], [apartNo], [size])
VALUES (2, 1, 2, 70);
SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Unit] OFF;

SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Unit] ON;
INSERT INTO [Infosys].[db_owner].[Group2_SS2023_Unit] ([id], [property_id], [apartNo], [size])
VALUES (3, 1, 3, 130);
SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Unit] OFF;

SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Unit] ON;
INSERT INTO [Infosys].[db_owner].[Group2_SS2023_Unit] ([id], [property_id], [apartNo], [size])
VALUES (4, 1, 4, 100);
SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Unit] OFF;

SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Unit] ON;
INSERT INTO [Infosys].[db_owner].[Group2_SS2023_Unit] ([id], [property_id], [apartNo], [size])
VALUES (5, 2, 1, 75);
SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Unit] OFF;

SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Unit] ON;
INSERT INTO [Infosys].[db_owner].[Group2_SS2023_Unit] ([id], [property_id], [apartNo], [size])
VALUES (6, 2, 2, 80);
SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Unit] OFF;

SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Unit] ON;
INSERT INTO [Infosys].[db_owner].[Group2_SS2023_Unit] ([id], [property_id], [apartNo], [size])
VALUES (7, 2, 3, 60);
SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Unit] OFF;

SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Unit] ON;
INSERT INTO [Infosys].[db_owner].[Group2_SS2023_Unit] ([id], [property_id], [apartNo], [size])
VALUES (8, 2, 4, 80);
SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Unit] OFF;

-- Tenant
SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Tenant] ON;
INSERT INTO [Infosys].[db_owner].[Group2_SS2023_Tenant] ([id], [name])
VALUES (1, 'Manuel Mueller');
SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Tenant] OFF;

SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Tenant] ON;
INSERT INTO [Infosys].[db_owner].[Group2_SS2023_Tenant] ([id], [name])
VALUES (2, 'Paul Koslowski');
SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Tenant] OFF;

SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Tenant] ON;
INSERT INTO [Infosys].[db_owner].[Group2_SS2023_Tenant] ([id], [name])
VALUES (3, 'Barbara Barni');
SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Tenant] OFF;

SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Tenant] ON;
INSERT INTO [Infosys].[db_owner].[Group2_SS2023_Tenant] ([id], [name])
VALUES (4, 'Manfred Mann');
SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Tenant] OFF;

SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Tenant] ON;
INSERT INTO [Infosys].[db_owner].[Group2_SS2023_Tenant] ([id], [name])
VALUES (5, 'Gudrun Gruner');
SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Tenant] OFF;

SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Tenant] ON;
INSERT INTO [Infosys].[db_owner].[Group2_SS2023_Tenant] ([id], [name])
VALUES (6, 'Petra Riester');
SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Tenant] OFF;

SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Tenant] ON;
INSERT INTO [Infosys].[db_owner].[Group2_SS2023_Tenant] ([id], [name])
VALUES (7, 'Heinz Haefele');
SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Tenant] OFF;

SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Tenant] ON;
INSERT INTO [Infosys].[db_owner].[Group2_SS2023_Tenant] ([id], [name])
VALUES (8, 'Bernhard Haug');
SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Tenant] OFF;

-- Lease
SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Lease] ON;
INSERT INTO [Infosys].[db_owner].[Group2_SS2023_Lease] ([id], [unit_id], [tenant_id], [endDate], [startDate], [nrResidents], [rentAmount])
VALUES (1, 1, 1, '2025-12-31', '2020-01-01', 1, 332.34);
SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Lease] OFF;

SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Lease] ON;
INSERT INTO [Infosys].[db_owner].[Group2_SS2023_Lease] ([id], [unit_id], [tenant_id], [endDate], [startDate], [nrResidents], [rentAmount])
VALUES (2, 2, 2, '2029-12-31', '2021-01-01', 3, 332.34);
SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Lease] OFF;

SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Lease] ON;
INSERT INTO [Infosys].[db_owner].[Group2_SS2023_Lease] ([id], [unit_id], [tenant_id], [endDate], [startDate], [nrResidents], [rentAmount])
VALUES (3, 3, 3, '2024-12-31', '2022-01-01', 4, 300);
SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Lease] OFF;

SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Lease] ON;
INSERT INTO [Infosys].[db_owner].[Group2_SS2023_Lease] ([id], [unit_id], [tenant_id], [endDate], [startDate], [nrResidents], [rentAmount])
VALUES (4, 4, 4, '2023-12-31', '2022-01-01', 1, 220.14);
SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Lease] OFF;

SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Lease] ON;
INSERT INTO [Infosys].[db_owner].[Group2_SS2023_Lease] ([id], [unit_id], [tenant_id], [endDate], [startDate], [nrResidents], [rentAmount])
VALUES (5, 5, 5, '2028-12-31', '2023-01-01', 1, 380);
SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Lease] OFF;

SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Lease] ON;
INSERT INTO [Infosys].[db_owner].[Group2_SS2023_Lease] ([id], [unit_id], [tenant_id], [endDate], [startDate], [nrResidents], [rentAmount])
VALUES (6, 6, 6, '2030-12-31', '2015-01-01', 2, 230);
SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Lease] OFF;

SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Lease] ON;
INSERT INTO [Infosys].[db_owner].[Group2_SS2023_Lease] ([id], [unit_id], [tenant_id], [endDate], [startDate], [nrResidents], [rentAmount])
VALUES (7, 7, 7, '2025-12-31', '2019-01-01', 2, 300);
SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Lease] OFF;

SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Lease] ON;
INSERT INTO [Infosys].[db_owner].[Group2_SS2023_Lease] ([id], [unit_id], [tenant_id], [endDate], [startDate], [nrResidents], [rentAmount])
VALUES (8, 8, 8, '2025-12-31', '2020-01-01', 3, 383.47);
SET IDENTITY_INSERT [Infosys].[db_owner].[Group2_SS2023_Lease] OFF;

-- Service Types
SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType ON;
INSERT INTO Infosys.db_owner.Group2_SS2023_ServiceType (id, type, distributionKey)
VALUES (99, 'Wasser', 'Person');
SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType OFF;

SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType ON;
INSERT INTO Infosys.db_owner.Group2_SS2023_ServiceType (id, type, distributionKey)
VALUES (100, 'Entwässerung', 'Person');
SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType OFF;

SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType ON;
INSERT INTO Infosys.db_owner.Group2_SS2023_ServiceType (id, type, distributionKey)
VALUES (101, 'Strom', 'Person');
SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType OFF;

SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType ON;
INSERT INTO Infosys.db_owner.Group2_SS2023_ServiceType (id, type, distributionKey)
VALUES (102, 'MüllÖffentlich', 'Behälter');
SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType OFF;

SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType ON;
INSERT INTO Infosys.db_owner.Group2_SS2023_ServiceType (id, type, distributionKey)
VALUES (103, 'StraßenreinigungÖff', 'Wohnfläche');
SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType OFF;

SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType ON;
INSERT INTO Infosys.db_owner.Group2_SS2023_ServiceType (id, type, distributionKey)
VALUES (104, 'Grundsteuern', 'Wohnfläche');
SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType OFF;

SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType ON;
INSERT INTO Infosys.db_owner.Group2_SS2023_ServiceType (id, type, distributionKey)
VALUES (109, 'Feuer_LWasser_Sturm', 'Wohnfläche');
SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType OFF;

SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType ON;
INSERT INTO Infosys.db_owner.Group2_SS2023_ServiceType (id, type, distributionKey)
VALUES (110, 'Glasversicherung', 'Wohnfläche');
SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType OFF;

SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType ON;
INSERT INTO Infosys.db_owner.Group2_SS2023_ServiceType (id, type, distributionKey)
VALUES (111, 'allgem. Haftpflicht', 'Wohnfläche');
SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType OFF;

SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType ON;
INSERT INTO Infosys.db_owner.Group2_SS2023_ServiceType (id, type, distributionKey)
VALUES (112, 'Gewässerhaftpflicht', 'Wohnfläche');
SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType OFF;

SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType ON;
INSERT INTO Infosys.db_owner.Group2_SS2023_ServiceType (id, type, distributionKey)
VALUES (113, 'Schornsteinreinigung', 'Einzelabrechnung');
SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType OFF;

SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType ON;
INSERT INTO Infosys.db_owner.Group2_SS2023_ServiceType (id, type, distributionKey)
VALUES (114, 'Heizung_Warmwasser', 'Wohnfläche');
SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType OFF;

SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType ON;
INSERT INTO Infosys.db_owner.Group2_SS2023_ServiceType (id, type, distributionKey)
VALUES (115, 'Breitband', 'Wohnfläche');
SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType OFF;

SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType ON;
INSERT INTO Infosys.db_owner.Group2_SS2023_ServiceType (id, type, distributionKey)
VALUES (116, 'Hauswart', 'Wohnfläche');
SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType OFF;

SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType ON;
INSERT INTO Infosys.db_owner.Group2_SS2023_ServiceType (id, type, distributionKey)
VALUES (117, 'Hausreinigung', 'Wohnfläche');
SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType OFF;

SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType ON;
INSERT INTO Infosys.db_owner.Group2_SS2023_ServiceType (id, type, distributionKey)
VALUES (118, 'Aufzug', 'Person');
SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType OFF;

SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType ON;
INSERT INTO Infosys.db_owner.Group2_SS2023_ServiceType (id, type, distributionKey)
VALUES (119, 'Gartenpflege', 'Wohnfläche');
SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType OFF;

SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType ON;
INSERT INTO Infosys.db_owner.Group2_SS2023_ServiceType (id, type, distributionKey)
VALUES (120, 'MüllNichtÖff', 'Wohnfläche');
SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType OFF;

SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType ON;
INSERT INTO Infosys.db_owner.Group2_SS2023_ServiceType (id, type, distributionKey)
VALUES (121, 'Winterdienst', 'Wohnfläche');
SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType OFF;

SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType ON;
INSERT INTO Infosys.db_owner.Group2_SS2023_ServiceType (id, type, distributionKey)
VALUES (122, 'Niederschlagsentw', 'Wohnfläche');
SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceType OFF;

-- Service Provider
SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceProvider ON;
INSERT INTO Infosys.db_owner.Group2_SS2023_ServiceProvider (id, name)
VALUES (16, 'COSMOSDIREKT');
SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceProvider OFF;

SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceProvider ON;
INSERT INTO Infosys.db_owner.Group2_SS2023_ServiceProvider (id, name)
VALUES (17, 'ENBW');
SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceProvider OFF;

SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceProvider ON;
INSERT INTO Infosys.db_owner.Group2_SS2023_ServiceProvider (id, name)
VALUES (18, 'STADT ESSLINGEN');
SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceProvider OFF;

SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceProvider ON;
INSERT INTO Infosys.db_owner.Group2_SS2023_ServiceProvider (id, name)
VALUES (19, 'HAUS UND GRUND E.V.');
SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceProvider OFF;

SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceProvider ON;
INSERT INTO Infosys.db_owner.Group2_SS2023_ServiceProvider (id, name)
VALUES (20, 'FA ESSLINGEN');
SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceProvider OFF;

SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceProvider ON;
INSERT INTO Infosys.db_owner.Group2_SS2023_ServiceProvider (id, name)
VALUES (21, 'HAUG GAS WASSER SCHUTT');
SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceProvider OFF;

-- Service contracts
SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceContract ON;
INSERT INTO Infosys.db_owner.Group2_SS2023_ServiceContract (id, unit_id, provider_id, serviceType_id, number)
VALUES (1, 1, 16, 111, '566227');
SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceContract OFF;

SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceContract ON;
INSERT INTO Infosys.db_owner.Group2_SS2023_ServiceContract (id, unit_id, provider_id, serviceType_id, number)
VALUES (2, 1, 17, 101, '005949');
SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceContract OFF;

SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceContract ON;
INSERT INTO Infosys.db_owner.Group2_SS2023_ServiceContract (id, unit_id, provider_id, serviceType_id, number)
VALUES (3, 2, 18, 99, '201739');
SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceContract OFF;

SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceContract ON;
INSERT INTO Infosys.db_owner.Group2_SS2023_ServiceContract (id, unit_id, provider_id, serviceType_id, number)
VALUES (4, 2, 21, 116, '411');
SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceContract OFF;

SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceContract ON;
INSERT INTO Infosys.db_owner.Group2_SS2023_ServiceContract (id, unit_id, provider_id, serviceType_id, number)
VALUES (5, 2, 20, 104, '776655');
SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceContract OFF;

SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceContract ON;
INSERT INTO Infosys.db_owner.Group2_SS2023_ServiceContract (id, unit_id, provider_id, serviceType_id, number)
VALUES (6, 2, 17, 101, '020054545');
SET IDENTITY_INSERT Infosys.db_owner.Group2_SS2023_ServiceContract OFF;