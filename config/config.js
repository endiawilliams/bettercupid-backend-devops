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
      "use_env_variable": "DATABASE_URL",
      "dialect": "postgres",
       "dialectOptions": {
  "ssl": {
    "rejectUnauthorized": false
  }
    }
    }
}
