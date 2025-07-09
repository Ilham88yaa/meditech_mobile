const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');

const app = express();
const port = 3000;

app.use(cors());
app.use(bodyParser.json());

// ROUTE TESTING UNTUK BROWSER
app.get('/', (req, res) => {
  res.send('Server berjalan dengan baik ✅');
});

// ROUTE UNTUK BOOKING (dari aplikasi Flutter)
app.post('/booking', (req, res) => {
  console.log('Data booking diterima:', req.body);
  res.status(200).json({ message: 'Booking berhasil diterima' });
});

// MENJALANKAN SERVER
app.listen(port, '0.0.0.0', () => {
  console.log(`Server Express berjalan di http://0.0.0.0:${port}`);
});

