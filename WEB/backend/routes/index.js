var express = require('express');
var router = express.Router();
const path = require('path')

var accountController = require('../controllers/accountController');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('pages/dashboard');
});

router.post('/signUp', accountController.signUp);
router.post('/signIn', accountController.signIn);

module.exports = router;
