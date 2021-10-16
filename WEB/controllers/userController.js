// 참고
// https://lgphone.tistory.com/86
// https://loy124.tistory.com/294
// https://velog.io/@hyunju-song/sequelize%EC%97%90%EC%84%9C-foreign-key-%EC%84%A4%EC%A0%95%ED%95%98%EA%B8%B0
// https://loy124.tistory.com/374

const { User } = require('../models');
const { Op } = require('sequelize');

// Create User
exports.create = (req, res) => {
    console.log('User create access!');

    // Error case
    if (!req.body.serial_num || !req.body.unit_num || !req.body.name) {    
        res.status(400).send({
            message: 'Specific Data is empty!'
        });

        return;
    }

    var pledge = JSON.stringify(req.body.security_pledge);

    const user = {
        name: req.body.name,
        serial_num: req.body.serial_num,
        unit_num: req.body.unit_num,
        device_num: req.body.device_num,
        security_pledge: pledge,
    };

    User
    .create(user)
    .then(data => {
        res.status(200).send(true);
        return;
    })
    .catch(err => {
        console.log(err.message);

        res.status(500).send({
            message: err.message
        });

        return;
    });
};

// Read all user
exports.findAll = (req, res) => {
    console.log('User findAll access');

    User
    .findAll()
    .then(data => {
        console.log(data[0]);

        res.render('users', {
            data: data[0]
        });
    })
    .catch(err => {
        console.log('erroccur');

        res.status(500).send({
            message: err.message || 'Retrieve all users failure'
        });
    });
};

// Read one user
exports.findOne = (req, res) => {
    
};