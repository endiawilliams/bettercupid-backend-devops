require('dotenv').config()
module.exports = {
    "development": {
      "username": "root",
      "password": null,
      "database": "better_cupid_dev",
      "host": "localhost",
      "dialect": "postgres"
    },
    "test": {
      "username": "postgres",
      "password": null,
      "database": "better_cupid_dev",
      "host": "db",
      "dialect": "postgres"
    },
    "production": {
      "username": "postgres",
      "password": process.env.DB_PASS,
      "database": "better_cupid_dev",
      "host": "localhost",
      "dialect": "postgres"
    }
}
