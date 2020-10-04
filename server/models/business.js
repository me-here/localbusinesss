const mongoose = require("mongoose");

// define schema of data
const businessSchema = new mongoose.Schema({
  lat: mongoose.SchemaTypes.Double,
  lon: mongoose.SchemaTypes.Double,
  address: String,
  name: String,
  description: String,
  imageUrl: String,
});

// exports schema to a model
const Business = mongoose.model("Business", businessSchema);

module.exports = Business;
