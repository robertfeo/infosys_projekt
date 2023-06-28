const express = require('express');
const { getConnection, releaseConnection } = require('./db'); // Import the getConnection and releaseConnection functions from db.js

const leaseRouter = express.Router();

leaseRouter.get('/leases', async (req, res) => {
  let connection;
  try {
    connection = await getConnection();
    const result = await connection.query('EXEC sp_getAllLeases');
    res.send(result.recordset);
  } catch (err) {
    console.error(err);
    res.status(500).send('Error retrieving data from the database');
  } finally {
    releaseConnection(connection);
  }
});

leaseRouter.get('/lease-units/:id', async (req, res) => {
  let connection;
  try {
    const { id } = req.params;
    connection = await getConnection();
    const result = await connection.query(`EXEC [db_owner].[Group2_SS2023_sp_getLeasesOfUnit] @unit_id= ${id}`);
    res.send(result.recordset);
  } catch (err) {
    console.error(err);
    res.status(500).send('Error retrieving data from the database');
  } finally {
    releaseConnection(connection);
  }
});

leaseRouter.get('/lease-details/:id', async (req, res) => {
  let connection;
  try {
    const { id } = req.params;
    connection = await getConnection();
    const result = await connection.query(`EXEC [db_owner].[Group2_SS2023_sp_getLeaseDetails ] @lease_id= ${id}`);
    res.send(result.recordset);
  } catch (err) {
    console.error(err);
    res.status(500).send('Error retrieving data from the database');
  } finally {
    releaseConnection(connection);
  }
});

module.exports = leaseRouter;