const sql = require('mssql');

// SQL Server configuration
const config = {
    user: 'wkb6',
    password: 'wkb6',
    server: 'itnt0005',
    database: 'Infosys',
    options: {
      trustServerCertificate: true
    }
  };

// Create a connection pool
const pool = new sql.ConnectionPool(config);

// Function to acquire a connection from the pool
const getConnection = async () => {
  try {
    const connection = await pool.connect();
    return connection;
  } catch (error) {
    console.log('Error acquiring database connection:', error);
    throw error;
  }
};

// Function to release a connection back to the pool
const releaseConnection = (connection) => {
  if (connection) {
    connection.release();
  }
};

// Export the getConnection and releaseConnection functions
module.exports = { getConnection, releaseConnection };