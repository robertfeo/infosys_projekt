const express = require('express');
const { getConnection, releaseConnection } = require('./db'); // Import the getConnection and releaseConnection functions from db.js

const tenantRouter = express.Router();

tenantRouter.get('/tenants', async (req, res) => {
	let connection;
	try {
		connection = await getConnection();
		const result = await connection.query('SELECT * FROM db_owner.Group2_SS2023_Tenant');
		res.send(result.recordset);
	} catch (err) {
		console.error(err);
		res.status(500).send('Error retrieving data from the database');
	} finally {
		releaseConnection(connection);
	}
});

tenantRouter.get('/tenants/:id', async (req, res) => {
	let connection;
	try {
		const { id } = req.params;
		connection = await getConnection();
		const query = `SELECT * FROM db_owner.Group2_SS2023_Tenant WHERE id = '${id}'`;
		const result = await connection.query(query);

		if (result.recordset.length === 0) {
			res.status(404).send('Tenant not found');
		} else {
			res.send(result.recordset[0]);
		}
	} catch (err) {
		console.error(err);
		res.status(500).send('Error retrieving tenant from the database');
	} finally {
		releaseConnection(connection);
	}
});

tenantRouter.post('/tenants', async (req, res) => {
	let connection;
	try {
		const { name } = req.body;
		connection = await getConnection();
		const query = `INSERT INTO db_owner.Group2_SS2023_Tenant (name) 
                   VALUES ('${name}')`;
		const result = await connection.query(query);
		res.send('Tenant data inserted successfully');
	} catch (err) {
		console.error(err);
		res.status(500).send('Error inserting tenant data into the database');
	} finally {
		releaseConnection(connection);
	}
});

tenantRouter.delete('/tenants/:id', async (req, res) => {
	let connection;
	try {
		const { id } = req.params;
		connection = await getConnection();
		const query = `DELETE FROM db_owner.Group2_SS2023_Tenant WHERE id = '${id}'`;
		const result = await connection.query(query);

		if (result.rowsAffected.length === 0) {
			res.status(404).send('Tenant not found');
		} else {
			res.send('Tenant deleted successfully');
		}
	} catch (err) {
		console.error(err);
		res.status(500).send('Error deleting tenant from the database');
	} finally {
		releaseConnection(connection);
	}
});

module.exports = tenantRouter;
