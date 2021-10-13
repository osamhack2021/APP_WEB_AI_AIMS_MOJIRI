var express = require('express');
var router = express.Router();

var deviceController = require('../controllers/deviceController');

router.post('/create', deviceController.create);

module.exports = router;
