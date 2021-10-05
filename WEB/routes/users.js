var express = require('express');

const path = require('path');
const multer = require('multer');

var storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, "public/images/");
    },
    filename: function (req, file, db) {
        const ext = path.extname(file.originalname);
        cb(null, path.basename(file.originalname, ext) + "-" + Date.now() + ext);
    },
});

var upload = multer({ storage: storage });

const router = express.Router();
const userController = require('../controllers/userController.js');

router.post('/create', upload.single('image'), userController.create);
                
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