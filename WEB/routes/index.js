var express = require('express');
var router = express.Router();

var accountController = require('../controllers/accountController');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('login');
});

router.post('/signUp', accountController.signUp);
router.post('/signIn', accountController.signIn);
router.post('/findInfo', accountController.findInfo);

module.exports = router;
