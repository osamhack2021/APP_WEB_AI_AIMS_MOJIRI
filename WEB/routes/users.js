var express = require('express');

const router = express.Router();
const userController = require('../controllers/userController.js');

// craete user
router.post('/create', userController.create);

// read all user
router.get('/', function(req, res, next) {
    console.log('users access');
    let users = {'id': '1', 'name': '노수인', 'serial_num': '20-76077320', 'device': '1234', 'pledge': 'true'};

    // let users = userController.findAll;

    console.log(users);

    res.render('users', {
        data: users
    });
    // res.render('users');
});

// read specific user
router.get('/:serial_num', userController.findOne);

// update user
// router.put('/:id', userController.update);

// delete user
// router.delete('/:id', userController.delete);

module.exports = router;