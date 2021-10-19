var express = require('express');
var router = express.Router();

var pictureController = require('../controllers/pictureController');

router.post('/create', pictureController.create);

module.exports = router;
