var express = require('express');
var router = express.Router();

const multer = require('multer');
const upload = multer({
    dest: 'public/images'
});

var pledgeControllers = require('../controllers/pledgeControllers');

router.post('/:filename', pledgeControllers.create);

module.exports = router;
