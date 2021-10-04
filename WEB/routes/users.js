var express = require('express');

const router = express.Router();
const userController = require('../controllers/userController.js');

router.post('/signUp', userController.create);

router.get('/', userController.findAll);
router.get('/signIn', userController.findOne);

// router.get('/:serial_num', userController.findOne);

// router.put('/:id', userController.update);

// router.delete('/:id', userController.delete);

// DB connection test
// router.get('/', (req, res) => {
//     connection.query('SELECT * from Users', (error, rows) => {
//         if (error) throw error;
//         console.log('User info is : ', rows);
//         res.send(rows);
//     });
// });

module.exports = router;