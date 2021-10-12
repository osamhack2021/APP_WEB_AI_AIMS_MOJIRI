var express = require('express');
var router = express.Router();

var accountController = require('../controllers/accountController');

/* GET home page. */
router.get('/', function(req, res, next) {
  console.log(__dirname + '/../views/login.html');

  res.render('login');
});

router.post('/signUp', accountController.signUp);
router.post('/signIn', accountController.signIn);

module.exports = router;
