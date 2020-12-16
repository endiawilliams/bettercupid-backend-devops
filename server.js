const app = require('./app')
const port = process.env.PORT || 4000

// connection
app.listen(port, () => console.log(`Server is running on port ${port}`))