const express = require('express');
const propertyRouter = require('./Routes/property');
const ownerRouter = require('./Routes/owner');
const tenantRouter = require('./Routes/tenant');
const serviceRouter = require('./Routes/service');
const leaseRouter = require('./Routes/leases');
const ledgerRouter = require('./Routes/generalLedger');
const app = express();
const mssql = require('mssql');
const fs = require('fs');

const config = {
    user: 'wkb6', password: 'wkb6', server: 'itnt0005', database: 'Infosys', options: {
        trustServerCertificate: true
    }
};

// Function to check if the trigger exists
async function checkTriggerExists() {
    const pool = await mssql.connect(config);
    try {

        const result = await pool
            .request()
            .query("SELECT COUNT(*) AS triggerCount FROM sys.triggers WHERE name = 'trg_insertAccountInformation'");

        return result.recordset[0].triggerCount > 0;
    } catch (err) {
        console.error('Error occurred while checking trigger existence:', err);
        throw err;
    }
}

async function executeTriggerSql() {
    const pool = await mssql.connect(config);
    try {

        const script = fs.readFileSync('../database/trigger/trg_insertAccountInformation.sql', 'utf8');
        await pool.request().batch(script);
        console.log('trg_insertAccountInformations.sql executed successfully.');
    } catch (err) {
        console.error('Error occurred while executing trg_insertAccountInformation.sql:', err);
        throw err;
    }
}

async function executeInitSql() {
    const pool = await mssql.connect(config);
    try {
        const tablesScript = fs.readFileSync('../database/initialize/CreateAllTables.sql', 'utf8');
        await pool.request().batch(tablesScript);
        console.log('Successful check for existing tables');

        const dataScript = fs.readFileSync('../database/initialize/insertDummyData.sql', 'utf8');
        await pool.request().batch(dataScript);
        console.log('Successful check for existing data');
    } catch (err) {
        console.error('Error occurred while executing CreateAllTables.sql:', err);
        throw err;
    }
}

// Check if the trigger exists and execute if it doesn't
async function checkTriggerAndExecute() {

    try {
        const triggerExists = await checkTriggerExists();
        if (!triggerExists) {
            await executeTriggerSql();
        } else {
            console.log('Trigger already exists. Skipping trigger.sql execution.');
        }
    } catch (err) {
        console.error('Error occurred:', err);
    }
}

// Execute CreateAllTables.sql
executeInitSql();

setTimeout(() => {
    checkTriggerAndExecute();
}, 5000)

app.use(function (request, response, next) {
    response.setHeader('Access-Control-Allow-Origin', '*');
    response.setHeader('Access-Control-Allow-Methods', '*');
    response.setHeader('Access-Control-Allow-Headers', '*');
    response.setHeader('Access-Control-Expose-Headers', '*');

    next();
});
app.use(express.urlencoded({
    extended: false
}));
app.use(express.json());
app.use('/', propertyRouter);
app.use('/', ownerRouter);
app.use('/', tenantRouter);
app.use('/', serviceRouter);
app.use('/', leaseRouter);
app.use('/', ledgerRouter);

const port = process.env.PORT || 3000;
app.listen(port, () => console.log(`Server listening on port ${port}...`));
