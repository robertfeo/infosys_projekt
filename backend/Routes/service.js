const express = require('express');
const { getConnection, releaseConnection } = require('./db'); // Import the getConnection and releaseConnection functions from db.js

const serviceRouter = express.Router();

serviceRouter.get('/service-charge-settlements', async (req, res) => {
  let connection;
  try {
    connection = await getConnection();
    const result = await connection.query('EXEC sp_getAllServiceChargeSettlements');
    res.send(result.recordset);
  } catch (err) {
    console.error(err);
    res.status(500).send('Error retrieving data from the database');
  } finally {
    releaseConnection(connection);
  }
});

serviceRouter.get('/ScssOfLease/:id', async (req, res) => {
  let connection;
  try {
    const { id } = req.params;
    connection = await getConnection();
    const result = await connection.query(`EXEC [db_owner].[Group2_SS2023_sp_getScssOfLease] @lease_id = '${id}'`);
    res.send(result.recordset);
  } catch (err) {
    console.error(err);
    res.status(500).send('Error retrieving data from the database');
  } finally {
    releaseConnection(connection);
  }
});

serviceRouter.get('/getScsDetails/:id', async (req, res) => {
  let connection;
  try {
    const { id } = req.params;
    connection = await getConnection();
    const result = await connection.query(`EXEC [db_owner].[Group2_SS2023_sp_getScsDetails ] @Scs_id = '${id}'`);
    res.send(result.recordset);
  } catch (err) {
    console.error(err);
    res.status(500).send('Error retrieving data from the database');
  } finally {
    releaseConnection(connection);
  }
});

serviceRouter.get('/getScofScss/:id', async (req, res) => {
  let connection;
  try {
    const { id } = req.params;
    connection = await getConnection();
    const result = await connection.query(`EXEC [db_owner].[Group2_SS2023_sp_getScofScss] @Scs_id = '${id}'`);
    res.send(result.recordset);
  } catch (err) {
    console.error(err);
    res.status(500).send('Error retrieving data from the database');
  } finally {
    releaseConnection(connection);
  }
});

module.exports = serviceRouter;