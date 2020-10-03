const mongoose = require("mongoose");
const express = require("express");
const businessRoute = require("./routes/businessRoute");
const mapRoute = require("./routes/mapRoute");
require("dotenv").config({ path: ".env" });

app = express();
app.use(express.json());

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Listening on port ${port}`);
});

const uri = process.env.ATLAS_URI;
console.log("MongoDB Atlas URI: " + uri);

mongoose
  .connect('mongodb+srv://Team:Lt4rl6tRM@cluster0.nab6t.mongodb.net/Team?retryWrites=true&w=majority', { useNewUrlParser: true, useUnifiedTopology: true })
  .catch((err) => console.log(err));

const connection = mongoose.connection;
connection.once("open", () => {
  console.log("Connection to MongoDB successful");
});

// First level endpoints of server
app.use("/business", businessRoute);
app.use("/map", mapRoute);
