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
        security_pledge: pledge,
    };

    User
    .create(user)
    .then(data => {
        console.log("User is created!");
        return true;
    })
    .catch(err => {
        res.status(500).send({
            message: err.message || 'Create user failure'
        });

        return;
    });
};

// Read all user
exports.findAll = (req, res) => {
    User
        .findAll()
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || 'Retrieve all users failure'
            });
        });
};

// Read one user
exports.findOne = (req, res) => {
    User
        .findOne({
            where: {
                serial_num: req.body.serial_num,
            },
        })
        .then(data => {
            if (data == null) {
                res.status(400).send({
                    message: 'User is not exist!'
                });

                return;
            }

            console.log(req.body.name + ' user signIn access');
            res.send(true);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || 'Retrieve user failure'
            });

            return;
        });
};