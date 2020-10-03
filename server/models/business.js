const mongoose = require('mongoose');

// define schema of data
const bSchema = new mongoose.Schema({
    lat: Number,
    lon: Number,
    address: String,
    name: String,
    description: String,
    imageUrl: String
});

// exports schema to a model
const Business = mongoose.model('Business', bSchema);

module.exports = Business;