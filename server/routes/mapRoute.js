const router = require('express').Router();
const axios = require('axios');

API_KEY = 'AIzaSyBk4_I6kJt42OHcxf-uyDlx7LUtQSykvWw';
API_URL = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?'

router.route('/').get((req, res) => {
    const lat = req.body.lat;
    const lon = req.body.lon;
    const radius = req.body.radius;

    axios.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=' + lat + ',' + lon + '&radius=' + radius + '&type=business&keyword=local&key=AIzaSyBk4_I6kJt42OHcxf-uyDlx7LUtQSykvWw')
        .then((response) => {
            console.log(response.data);
            res.json(response.data);
        })
        .catch(err => {
            console.log(err);
            console.log(err.response.data.error);
        });

    //console.log(places);
    //res.json(places);
});



module.exports = router;

// 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=1500&type=business&keyword=local&key=AIzaSyBk4_I6kJt42OHcxf-uyDlx7LUtQSykvWw'