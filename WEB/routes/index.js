var express = require('express');
var router = express.Router();

var accountController = require('../controllers/accountController');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.post('/create', accountController.create);

module.exports = router;
