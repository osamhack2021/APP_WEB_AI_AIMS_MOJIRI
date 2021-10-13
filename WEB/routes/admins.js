var express = require('express');

const router = express.Router();
const adminController = require('../controllers/adminController.js');

router.get('/', function(req, res, next) {
    res.render('login');
});

router.post('/signIn', adminController.signIn);

module.exports = router;