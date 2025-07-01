const express = require('express');
const app = express();
const cors = require('cors');
app.use(cors());

app.get('/api', (req, res) => {
    res.json({ message: 'Hello from backend!' });
});

app.listen(5000, () => console.log('Backend running on http://localhost:5000'));
