const app = require('./app')
const port = process.env.PORT || 4000

const {exec} = require('child_process');
const waitPort = require('wait-port');

const env = process.env.NODE_ENV || 'development';
const config = require(__dirname + '/config/config.js')[env];

const params = {};
params.host = config.host;
params.port = 5432;

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