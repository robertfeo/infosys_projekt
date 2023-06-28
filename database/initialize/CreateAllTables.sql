USE Infosys;
-----------------------------create tables------------------------------
IF NOT EXISTS (SELECT 1
FROM sys.tables
WHERE name = 'Group2_SS2023_Tenant')
BEGIN
  CREATE TABLE Group2_SS2023_Tenant
  (
    id INT IDENTITY(1,1),
    name VARCHAR(20),
    PRIMARY KEY (id)
  );
END;

-- Check and create Group2_SS2023_Owner table
IF NOT EXISTS (SELECT 1
FROM sys.tables
WHERE name = 'Group2_SS2023_Owner')
BEGIN
  CREATE TABLE Group2_SS2023_Owner
  (
    id INT IDENTITY(1,1),
    name VARCHAR(20),
    street VARCHAR(50),
    city VARCHAR(20),
    zip INT,
    PRIMARY KEY (id)
  );
END;

-- Check and create Group2_SS2023_Property table
IF NOT EXISTS (SELECT 1
FROM sys.tables
WHERE name = 'Group2_SS2023_Property')
BEGIN
  CREATE TABLE Group2_SS2023_Property
  (
    id INT IDENTITY(1,1),
    owner_id INT,
    street VARCHAR(50),
    city VARCHAR(20),
    zip INT,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES Group2_SS2023_Owner(id)
  );
END;

-- Check and create Group2_SS2023_Unit table
IF NOT EXISTS (SELECT 1
FROM sys.tables
WHERE name = 'Group2_SS2023_Unit')
BEGIN
  CREATE TABLE Group2_SS2023_Unit
  (
    id INT IDENTITY(1,1),
    property_id INT,
    apartNo INT,
    size INT,
    PRIMARY KEY (id),
    FOREIGN KEY (property_id) REFERENCES Group2_SS2023_Property(id)
  );
END;

-- Check and create Group2_SS2023_ServiceProvider table
IF NOT EXISTS (SELECT 1
FROM sys.tables
WHERE name = 'Group2_SS2023_ServiceProvider')
BEGIN
  CREATE TABLE Group2_SS2023_ServiceProvider
  (
    id INT IDENTITY(1,1),
    name VARCHAR(50),
    PRIMARY KEY (id)
  );
END;

-- Check and create Group2_SS2023_ServiceType table
IF NOT EXISTS (SELECT 1
FROM sys.tables
WHERE name = 'Group2_SS2023_ServiceType')
BEGIN
  CREATE TABLE Group2_SS2023_ServiceType
  (
    id INT IDENTITY(1,1),
    type VARCHAR(20),
    distributionKey VARCHAR(20),
    PRIMARY KEY (id)
  );
END;

-- Check and create Group2_SS2023_ServiceContract table
IF NOT EXISTS (SELECT 1
FROM sys.tables
WHERE name = 'Group2_SS2023_ServiceContract')
BEGIN
  CREATE TABLE Group2_SS2023_ServiceContract
  (
    id INT IDENTITY(1,1),
    unit_id INT,
    provider_id INT,
    serviceType_id INT,
    number VARCHAR(50),
    PRIMARY KEY (id),
    FOREIGN KEY (unit_id) REFERENCES Group2_SS2023_Unit(id),
    FOREIGN KEY (provider_id) REFERENCES Group2_SS2023_ServiceProvider(id),
    FOREIGN KEY (serviceType_id) REFERENCES Group2_SS2023_ServiceType(id)
  );
END;

-- Check and create Group2_SS2023_GeneralLedger table
IF NOT EXISTS (SELECT 1
               FROM sys.tables
               WHERE name = 'Group2_SS2023_GeneralLedger')
    BEGIN
        CREATE TABLE Group2_SS2023_GeneralLedger
        (
            id INT IDENTITY(1,1),
            serviceContract_id INT,
            payment FLOAT,
            bookingDay DATE,
            purpose VARCHAR(100),
            payer VARCHAR(50),
            PRIMARY KEY (id),
            FOREIGN KEY (serviceContract_id) REFERENCES Group2_SS2023_ServiceContract(id)
        );
    END;

-- Check and create Group2_SS2023_Lease table
IF NOT EXISTS (SELECT 1
FROM sys.tables
WHERE name = 'Group2_SS2023_Lease')
BEGIN
  CREATE TABLE Group2_SS2023_Lease
  (
    id INT IDENTITY(1,1),
    unit_id INT,
    tenant_id INT,
    endDate DATE,
    startDate DATE,
    nrResidents INT,
    rentAmount FLOAT,
    PRIMARY KEY (id),
    FOREIGN KEY (tenant_id) REFERENCES Group2_SS2023_Tenant(id),
    FOREIGN KEY (unit_id) REFERENCES Group2_SS2023_Unit(id)
  );
END;

-- Check and create Group2_SS2023_Rent table
IF NOT EXISTS (SELECT 1
FROM sys.tables
WHERE name = 'Group2_SS2023_Rent')
BEGIN
  CREATE TABLE Group2_SS2023_Rent
  (
    id INT IDENTITY(1,1),
    lease_id INT,
    generalLedger_id INT,
    rent FLOAT,
    rentDifference FLOAT,
    PRIMARY KEY (id),
    FOREIGN KEY (generalLedger_id) REFERENCES Group2_SS2023_GeneralLedger(id),
    FOREIGN KEY (lease_id) REFERENCES Group2_SS2023_Lease(id)
  );
END;

-- Check and create Group2_SS2023_ServiceCharge table
IF NOT EXISTS (SELECT 1
FROM sys.tables
WHERE name = 'Group2_SS2023_ServiceCharge')
BEGIN
  CREATE TABLE Group2_SS2023_ServiceCharge
  (
    id INT IDENTITY(1,1),
    lease_id INT,
    generalLedger_id INT,
    payment FLOAT,
    PRIMARY KEY (id),
    FOREIGN KEY (lease_id) REFERENCES Group2_SS2023_Lease(id),
    FOREIGN KEY (generalLedger_id) REFERENCES Group2_SS2023_GeneralLedger(id)
  );
END;

-- Check and create Group2_SS2023_Staging table
IF NOT EXISTS (SELECT 1
FROM sys.tables
WHERE name = 'Group2_SS2023_Staging')
BEGIN
  CREATE TABLE Group2_SS2023_Staging
  (
    id INT IDENTITY(1,1),
    payment FLOAT,
    bookingDay DATE,
    purpose VARCHAR(100),
    payer VARCHAR(50),
    PRIMARY KEY (id)
  );
END;
