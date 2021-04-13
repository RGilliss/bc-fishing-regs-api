let dbParams = {};
if (process.env.DATABASE_URL) {
  dbParams.connectionString = process.env.DATABASE_URL;
  dbConfig.ssl = { rejectUnauthorized: false };
} else {
  dbParams = {
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME
  };
}

module.exports = dbParams;

//Gary's code

// let dbConfig = {};
// if (process.env.DATABASE_URL) {
//   dbConfig.connectionString = process.env.DATABASE_URL;
//   dbConfig.ssl = { rejectUnauthorized: false };
// } else {
//   dbConfig = {
//     user: process.env.DB_USER || "vagrant",
//     password: process.env.DB_PASS || "123",
//     host: process.env.DB_HOST || "localhost",
//     database: process.env.DB_NAME || "loan-payment",
//     port: process.env.DB_PORT || 5432,
//     ssl: { rejectUnauthorized: false },
//   };
// }
