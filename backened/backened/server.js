const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const authRoutes = require('./routes/auth');
const toolRoutes = require('./routes/tools');
const userRoutes = require('./routes/user');

const app = express();
const PORT = 8000;

mongoose.connect('MONGODB_URI', { useNewUrlParser: true, useUnifiedTopology: true })
    .then(() => console.log("MongoDB connected"))
    .catch(err => console.error("MongoDB connection error:", err));

app.use(bodyParser.json());

app.use('/api', authRoutes);
app.use('/api', userRoutes);
app.use('/api', toolRoutes);

app.listen(PORT, () => console.log(`Server running on http://127.0.0.1:${PORT}`));
