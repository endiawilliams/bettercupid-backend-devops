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
  origin: (process.env.NODE_ENV == "production") ? 'http://bettercupid.endia.dev' : 'http://localhost.localdomain:3000',
  credentials: true, 
  optionsSuccessStatus: 204
}

app.use(cors(corsOptions))

// middleware - session config
app.use(session({
  // session is stored in the DB
  secret: process.env.COOKIE_SECRET || 'fnord C97445F4 5CDEF9F0',
  resave: false, 
  saveUninitialized: false, 
  cookie: {
    maxAge: 1000 * 60 * 60 * 24,
    secure: process.env.NODE_ENV == "production"
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