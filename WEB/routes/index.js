var express = require('express');
var router = express.Router();
const path = require('path')

var accountController = require('../controllers/accountController');

/* GET home page. */
// router.get('/', function(req, res, next) {
//   res.render('index', { error: false });
// });

router.get('/', function(req, res, err) {
  res.sendFile(path.join(__dirname + "/../views/index.html"));
})

router.post('/signUp', accountController.signUp);
router.post('/signIn', accountController.signIn);

module.exports = router;
