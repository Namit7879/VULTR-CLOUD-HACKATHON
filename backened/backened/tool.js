const mongoose = require('mongoose');

const toolSchema = new mongoose.Schema({
    name: String,
    description: String,
    url: String,
    type: String // e.g., 'trending', 'recently_used', etc.
});

module.exports = mongoose.model('Tool', toolSchema);
