var express = require('express');

const router = express.Router();
const userController = require('../controllers/userController.js');

// craete user
router.post('/create', userController.create);

// read all user
router.get('/', function(req, res, next) {
    console.log('users access');

    let users = userController.findAll;
    res.render('users', { data: users });
});

// read specific user
router.get('/:serial_num', userController.findOne);

// update user
// router.put('/:id', userController.update);

// delete user
// router.delete('/:id', userController.delete);

module.exports = router;