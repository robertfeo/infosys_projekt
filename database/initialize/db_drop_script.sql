IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[db_owner].[Group2_SS2023_Staging]') AND type in (N'U'))
    DROP TABLE [db_owner].[Group2_SS2023_Staging]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[db_owner].[Group2_SS2023_Rent]') AND type in (N'U'))
    DROP TABLE [db_owner].[Group2_SS2023_Rent]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[db_owner].[Group2_SS2023_ServiceCharge]') AND type in (N'U'))
    DROP TABLE [db_owner].[Group2_SS2023_ServiceCharge]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[db_owner].[Group2_SS2023_Lease]') AND type in (N'U'))
    DROP TABLE [db_owner].[Group2_SS2023_Lease]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[db_owner].[Group2_SS2023_GeneralLedger]') AND type in (N'U'))
    DROP TABLE [db_owner].[Group2_SS2023_GeneralLedger]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[db_owner].[Group2_SS2023_ServiceContract]') AND type in (N'U'))
    DROP TABLE [db_owner].[Group2_SS2023_ServiceContract]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[db_owner].[Group2_SS2023_ServiceType]') AND type in (N'U'))
    DROP TABLE [db_owner].[Group2_SS2023_ServiceType]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[db_owner].[Group2_SS2023_ServiceProvider]') AND type in (N'U'))
    DROP TABLE [db_owner].[Group2_SS2023_ServiceProvider]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[db_owner].[Group2_SS2023_Unit]') AND type in (N'U'))
    DROP TABLE [db_owner].[Group2_SS2023_Unit]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[db_owner].[Group2_SS2023_Property]') AND type in (N'U'))
    DROP TABLE [db_owner].[Group2_SS2023_Property]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[db_owner].[Group2_SS2023_Tenant]') AND type in (N'U'))
    DROP TABLE [db_owner].[Group2_SS2023_Tenant]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[db_owner].[Group2_SS2023_Owner]') AND type in (N'U'))
    DROP TABLE [db_owner].[Group2_SS2023_Owner]
GO