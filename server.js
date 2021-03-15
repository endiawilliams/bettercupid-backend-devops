const app = require('./app')
const port = process.env.PORT || 4000

const {exec} = require('child_process');
const waitPort = require('wait-port');

const env = process.env.NODE_ENV || 'development';
const config = require(__dirname + '/config/config.js')[env];

const params = {};

const url = require('url')
params.port = 5432;
if (config.use_env_variable) {
    params.host = url(process.env[config.use_env_variable]).host
else {
    params.host = config.host;
}

(async () =>{

    //wait until postgres is available
    await waitPort(params);

    //attempt to migrate
    await new Promise((resolve, reject) => {
        const migrate = exec(
            'npx sequelize db:migrate',
            {env: process.env},
            err => (err ? reject(err): resolve())
        );

        // Forward stdout+stderr to this process
        migrate.stdout.pipe(process.stdout);
        migrate.stderr.pipe(process.stderr);
    });

    // connection
    app.listen(port, () => console.log(`Server is running on port ${port}`))
})();
