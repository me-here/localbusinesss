const router = require("express").Router();
const Business = require("../models/business");

router.route("/").get((req, res) => {
  Business.find()
    .then((businesses) => res.json(businesses))
    .catch((err) => res.status(400).json("Error: " + err));
});

router.route("/filter").get(async (req, res) => {
  Business.find({
    address: req.body.address,
  })
    .then((businesses) => res.json(businesses))
    .catch((err) => res.status(400).json("Error: " + err));
});

router.route("/add").post((req, res) => {
  const lat = parseInt(req.body.lat);
  const lon = parseInt(req.body.lon);
  const address = req.body.address;
  const name = req.body.name;
  const description = req.body.descrip;
  const imageUrl = req.body.imageUrl;

  const b = new Business({
    lat: lat,
    lon: lon,
    address: address,
    name: name,
    descrip: description,
    imageUrl: imageUrl,
  });

  b.save()
    .then(() => res.json("Successfully saved!"))
    .catch((err) => res.status(400).json("Error: " + err));
});

module.exports = router;
