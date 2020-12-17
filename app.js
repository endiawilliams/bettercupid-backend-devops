// imports
require('dotenv').config();
const express = require('express')
const cors = require('cors')
const session = require('express-session')
const morgan = require('morgan')

const routes = require('./routes')
const passport = require('./passport')

const app = express() 

// middleware - server logging
app.use(morgan('dev'))

// middleware - JSON parsing
app.use(express.json())

// middleware - cors
const corsOptions = {
  // from which URLs do we want to accept requests
  // origin: ['http://localhost:3000'],
  credentials: true, // allow the session cookie to be sent to and from the client
  optionsSuccessStatus: 204
}

app.use(cors(corsOptions))

// middleware - session config
app.use(session({
  // session is stored in the DB
  secret: "8ufshvkjzdglaurh4guesidxbfcgfrfwhioen",
  // these are false in the repo on GitHub, this is to solve the CORS bug causing session corruption
  resave: true, // will not resave sessions
  saveUninitialized: true, // only create a session when a property is added to the session
  cookie: {
    maxAge: 1000 * 60 * 60 * 24,
    secure: false
  }
}))

// middleware - passport config
app.use(passport.initialize())
app.use(passport.session())

// middleware - API routes
app.use('/api/v1/auth', routes.auth)
app.use('/api/v1/profile', routes.profile);
app.use('/api/v1/relationship', routes.relationship);

module.exports = app