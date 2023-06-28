const express = require('express');
const { getConnection, releaseConnection } = require('./db'); // Import the getConnection and releaseConnection functions from db.js

const ownerRouter = express.Router();

ownerRouter.get('/owners', async (req, res) => {
  let connection;
  try {
    connection = await getConnection();
    const result = await connection.query('SELECT * FROM db_owner.Group2_SS2023_Owner');
    res.send(result.recordset);
  } catch (err) {
    console.error(err);
    res.status(500).send('Error retrieving data from the database');
  } finally {
    releaseConnection(connection);
  }
});

ownerRouter.get('/owners/:id', async (req, res) => {
  let connection;
  try {
    const { id } = req.params;
    connection = await getConnection();
    const query = `SELECT * FROM db_owner.Group2_SS2023_Owner WHERE id = '${id}'`;
    const result = await connection.query(query);

    if (result.recordset.length === 0) {
      res.status(404).send('Owner not found');
    } else {
      res.send(result.recordset[0]);
    }
  } catch (err) {
    console.error(err);
    res.status(500).send('Error retrieving owner from the database');
  } finally {
    releaseConnection(connection);
  }
});

ownerRouter.post('/owners', async (req, res) => {
  let connection;
  try {
    const { name, street, city, zip } = req.body;
    connection = await getConnection();
    const query = `INSERT INTO db_owner.Group2_SS2023_Owner ( name, street, city, zip) 
                   VALUES ('${name}', '${street}', '${city}', '${zip}')`;
    const result = await connection.query(query);
    res.send('Owner data inserted successfully');
  } catch (err) {
    console.error(err);
    res.status(500).send('Error inserting owner data into the database');
  } finally {
    releaseConnection(connection);
  }
});

ownerRouter.delete('/owners/:id', async (req, res) => {
  let connection;
  try {
    const { id } = req.params;
    connection = await getConnection();
    const query = `DELETE FROM db_owner.Group2_SS2023_Owner WHERE id = '${id}'`;
    const result = await connection.query(query);

    if (result.rowsAffected.length === 0) {
      res.status(404).send('Owner not found');
    } else {
      res.send('Owner deleted successfully');
    }
  } catch (err) {
    console.error(err);
    res.status(500).send('Error deleting owner from the database');
  } finally {
    releaseConnection(connection);
  }
});

module.exports = ownerRouter;