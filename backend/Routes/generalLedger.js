const express = require('express');
const { getConnection, releaseConnection } = require('./db'); // Import the getConnection and releaseConnection functions from db.js

const ledgerRouter = express.Router();

ledgerRouter.post('/payment', async (req, res) => {
  let connection;
  try {
    const entries = req.body;

    connection = await getConnection();

    const successfulInsertions = []; // Store the JSON bodies that were successfully inserted
    const failedInsertions = []; // Store the JSON bodies that failed to be inserted due to the trigger's validation

    // Continue inserting the remaining bodies even if one fails because of the trigger
    for (const entry of entries) {
      const { bookingDay, purpose, payer, payment } = entry;

      const query = `INSERT INTO db_owner.Group2_SS2023_Staging (payment, bookingDay, purpose, payer) 
                     VALUES ('${payment}', '${bookingDay}', '${purpose}', '${payer}')`;

      try {
        await connection.query(query);
        successfulInsertions.push(entry);
      } catch (err) {
        failedInsertions.push(entry);
      }
    }

    res.json({
      successfulInsertions: successfulInsertions,
      failedInsertions: failedInsertions
    });
  } catch (err) {
    console.error(err);
    res.status(500).send('Error. Payment could not be created');
  } finally {
    releaseConnection(connection);
  }
});

module.exports = ledgerRouter;