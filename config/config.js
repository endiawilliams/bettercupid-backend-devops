require('dotenv').config()
module.exports = {
    "development": {
      "use_env_variable": "DATABASE_URL",
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
