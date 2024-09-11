const express = require('express');
const cors = require('cors');
const app = express();
const clientsRouter = require('./routes/clients');
const config = require('./config');
const { LANGUAGES, FUNDING_SOURCES } = require('./enums');

// Enable CORS for all routes
app.use(cors());

// Middleware for parsing JSON requests
app.use(express.json());

// Use clients routes
app.use('/clients', clientsRouter);

// Centralized error handler
app.use((err, req, res, next) => {
  console.error(err.stack); // Log the error stack trace
  res.status(500).send({ error: 'Something went wrong' });
});

// Start server
app.listen(config.server.port, () => {
  console.log(`Server is running on port ${config.server.port}`);
});
