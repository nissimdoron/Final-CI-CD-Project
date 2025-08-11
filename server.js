// server.js
const express = require('express');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 5050;

// Serve static files (CSS, images, JS) from the current directory
app.use(express.static(path.join(__dirname)));

// Route for the homepage
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'));
});

// Start server
app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});

