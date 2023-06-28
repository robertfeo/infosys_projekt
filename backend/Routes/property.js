const express = require('express');
const propertyRouter = express.Router();
const { getConnection, releaseConnection } = require('./db');

propertyRouter.get('/properties', async (req, res) => {
  let connection;
  try {
    connection = await getConnection();
    const result = await connection.query('SELECT * FROM db_owner.Group2_SS2023_Property');
    res.send(result.recordset);
  } catch (err) {
    console.error(err);
    res.status(500).send('Error retrieving data from the database');
  } finally {
    releaseConnection(connection);
  }
});

propertyRouter.get('/properties-owners', async (req, res) => {
  let connection;
  try {
    connection = await getConnection();
    const result = await connection.query('EXEC [db_owner].[Group2_SS2023_sp_getAllProperties]');
    res.send(result.recordset);
  } catch (err) {
    console.error(err);
    res.status(500).send('Error retrieving data from the database');
  } finally {
    releaseConnection(connection);
  }
});

propertyRouter.get('/units', async (req, res) => {
  let connection;
  try {
    connection = await getConnection();
    const result = await connection.query('SELECT * FROM db_owner.Group2_SS2023_Unit');
    res.send(result.recordset);
  } catch (err) {
    console.error(err);
    res.status(500).send('Error retrieving data from the database');
  } finally {
    releaseConnection(connection);
  }
});

propertyRouter.post('/units', async (req, res) => {
  let connection;
  try {
    const { property_id, apartNo, size } = req.body;
    connection = await getConnection();
    const query = `INSERT INTO db_owner.Group2_SS2023_Unit (property_id,apartNo,size) 
                   VALUES (${property_id},${apartNo},${size})`;
    const result = await connection.query(query);
    res.send('Data inserted successfully');
  } catch (err) {
    console.error(err);
    res.status(500).send('Error. Unit could not be created');
  } finally {
    releaseConnection(connection);
  }
});

propertyRouter.get('/properties-details/:id', async (req, res) => {
  let connection;
  try {
    const { id } = req.params;
    connection = await getConnection();
    const result = await connection.query(`EXEC [db_owner].[sp_getPropertyDetails] @property_id = '${id}'`);
    res.send(result.recordset);
  } catch (err) {
    res.status(500).send('Error retrieving data from the database');
  } finally {
    releaseConnection(connection);
  }
});

propertyRouter.get('/properties-units/:id', async (req, res) => {
  let connection;
  try {
    const { id } = req.params;
    connection = await getConnection();
    const result = await connection.query(`EXEC [db_owner].[sp_getUnitsOfProperty] @property_id = '${id}'`);
    res.send(result.recordset);
  } catch (err) {
    console.error(err);
    res.status(500).send('Error retrieving data from the database');
  } finally {
    releaseConnection(connection);
  }
});

propertyRouter.get('/rent/:id', async (req, res) => {
  let connection;
  try {
    const { id } = req.params;
    connection = await getConnection();
    const query = `EXEC [db_owner].[Group2_SS2023_sp_getRentForUnit] @unit_id = '${id}'`;
    const result = await connection.query(query);

    if (result.recordset.length === 0) {
      res.status(404).send('Property not found');
    } else {
      res.send(result.recordset);
    }
  } catch (err) {
    console.error(err);
    res.status(500).send('Error retrieving data from the database');
  } finally {
    releaseConnection(connection);
  }
});

propertyRouter.get('/properties/:id', async (req, res) => {
  let connection;
  try {
    const { id } = req.params;
    connection = await getConnection();
    const query = `SELECT * FROM db_owner.Group2_SS2023_Property WHERE id = '${id}'`;
    const result = await connection.query(query);

    if (result.recordset.length === 0) {
      res.status(404).send('Property not found');
    } else {
      res.send(result.recordset[0]);
    }
  } catch (err) {
    console.error(err);
    res.status(500).send('Error retrieving property from the database');
  } finally {
    releaseConnection(connection);
  }
});

propertyRouter.delete('/properties/:id', async (req, res) => {
  let connection;
  try {
    const { id } = req.params;
    connection = await getConnection();
    const query = `DELETE FROM db_owner.Group2_SS2023_Property WHERE id = '${id}'`;
    const result = await connection.query(query);

    if (result.rowsAffected.length === 0) {
      res.status(404).send('Property not found');
    } else {
      res.send('Property deleted successfully');
    }
  } catch (err) {
    console.error(err);
    res.status(500).send('Error deleting property from the database');
  } finally {
    releaseConnection(connection);
  }
});

propertyRouter.post('/properties', async (req, res) => {
  let connection;
  try {
    const { owner_id, street, city, zip } = req.body;
    connection = await getConnection();
    const query = `INSERT INTO db_owner.Group2_SS2023_Property (owner_id,street,city,zip) 
                   VALUES ('${owner_id}', '${street}','${city}','${zip}')`;
    const result = await connection.query(query);
    res.send('Data inserted successfully');
  } catch (err) {
    console.error(err);
    res.status(500).send('Error. Property could not be created');
  } finally {
    releaseConnection(connection);
  }
});

propertyRouter.patch('/properties/:id', async (req, res) => {
  let connection;
  try {
    const { id } = req.params;
    const { owner_id, street, city, zip } = req.body;
    connection = await getConnection();
    const query = `UPDATE db_owner.Group2_SS2023_Property 
                   SET owner_id = '${owner_id}', street = '${street}', city = '${city}', zip = '${zip}'
                   WHERE id = '${id}'`;
    const result = await connection.query(query);
    res.send('Data updated successfully');
  } catch (err) {
    console.error(err);
    res.status(500).send('Error. Property could not be updated');
  } finally {
    releaseConnection(connection);
  }
});

module.exports = propertyRouter;
