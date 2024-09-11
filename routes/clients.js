const express = require('express');
const router = express.Router();
const db = require('../db');
const moment = require('moment');
const { v4: uuidv4 } = require('uuid');
const { LANGUAGES } = require('../enums');



// Helper function to validate input
const validateInput = (name, date_of_birth, main_language, secondary_language, funding_source_id) => {
  if (!name || !date_of_birth || !main_language) {
    return 'Name, Date of Birth, and Main Language are required';
  }
  if (isNaN(Date.parse(date_of_birth))) {
    return 'Invalid Date of Birth';
  }
  if (!LANGUAGES.includes(main_language) || (secondary_language && !LANGUAGES.includes(secondary_language))) {
    return 'Invalid language';
  }
  return null;
};

// GET all clients
router.get('/', async (req, res, next) => {
  try {
    const result = await db.query('SELECT * FROM clients');
    const clients = result.rows.map(client => ({
      ...client,
      date_of_birth: moment(client.date_of_birth).format('DD-MM-YYYY') // Format date for response
    }));
    res.json(clients);
  } catch (err) {
    next(err); // Pass error to error handler
  }
});

// GET a single client by ID
router.get('/:id', async (req, res, next) => {
  const { id } = req.params;
  try {
    const result = await db.query('SELECT * FROM clients WHERE id = $1', [id]);
    if (result.rows.length === 0) {
      return res.status(404).send('Client not found');
    }
    const client = result.rows[0];
    client.date_of_birth = moment(client.date_of_birth).format('DD-MM-YYYY'); // Format date
    res.json(client);
  } catch (err) {
    next(err);
  }
});

// POST a new client
router.post('/', async (req, res, next) => {
  const { name, date_of_birth, main_language, secondary_language, funding_source_id } = req.body;

  // Validate input
  const validationError = validateInput(name, date_of_birth, main_language, secondary_language, funding_source_id);
  if (validationError) {
    return res.status(400).json({ error: validationError });
  }
  
  // Parse date_of_birth to a Date object
  const parsedDateOfBirth = new Date(date_of_birth);

  // Generate a unique ID for the new client
  const id = uuidv4();

  try {
    const result = await db.query(
      'INSERT INTO clients (id, name, date_of_birth, main_language, secondary_language, funding_source_id) VALUES ($1, $2, $3, $4, $5, $6) RETURNING *',
      [id, name, parsedDateOfBirth, main_language, secondary_language, funding_source_id]
    );
    res.status(201).json(result.rows[0]);
  } catch (err) {
    next(err); // Pass error to error handler
  }
});

// PUT (update) an existing client by ID
router.put('/:id', async (req, res, next) => {
  const { id } = req.params;
  const { name, date_of_birth, main_language, secondary_language, funding_source_id } = req.body;

  if (!name || !date_of_birth || !main_language) {
    return res.status(400).json({ error: 'Name, Date of Birth, and Main Language are required' });
  }

  try {
    const result = await db.query(
      'UPDATE clients SET name = $1, date_of_birth = $2, main_language = $3, secondary_language = $4, funding_source_id = $5 WHERE id = $6 RETURNING *',
      [name, date_of_birth, main_language, secondary_language, funding_source_id, id]
    );
    if (result.rows.length === 0) {
      return res.status(404).send('Client not found');
    }
    res.json(result.rows[0]);
  } catch (err) {
    next(err);
  }
});

// DELETE a client by ID
router.delete('/:id', async (req, res, next) => {
  const { id } = req.params;
  try {
    const result = await db.query('DELETE FROM clients WHERE id = $1 RETURNING *', [id]);
    if (result.rows.length === 0) {
      return res.status(404).send('Client not found');
    }
    res.status(204).send(); // No content
  } catch (err) {
    next(err);
  }
});

module.exports = router;
