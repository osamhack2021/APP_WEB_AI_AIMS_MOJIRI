var express = require('express');

const multer = require('multer');
const upload = multer({
    dest: 'uploads/'
});

const router = express.Router();
const userController = require('../controllers/userController.js');
const deviceController = require('../controllers/deviceController.js');
const imageController = require('../controllers/imageController.js');

router.post('/signUp', userController.create

    // .then(() => {
    //     deviceController.create;
    //     imageController.create;
    // });
);
                
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