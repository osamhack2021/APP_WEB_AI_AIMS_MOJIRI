// 참고
// https://lgphone.tistory.com/86
// https://loy124.tistory.com/294
// https://velog.io/@hyunju-song/sequelize%EC%97%90%EC%84%9C-foreign-key-%EC%84%A4%EC%A0%95%ED%95%98%EA%B8%B0
// https://loy124.tistory.com/374

const { User } = require('../models');
const { Device } = require('../models');
const { Soldier } = require('../models');
const { Op } = require('sequelize');

// Create User
exports.create = (req, res) => {
    // Error case
    if (!req.body.serial_num || !req.body.unit_num || !req.body.name) {
        res.status(400).send({
            message: 'Specific Data is empty!'
        });

        return;
    }
    
    // 1. 국방부 DB와 연계하여 조회 
    // input : serial_num / output : name, unit_num
    var permission;

    Soldier
        .findOne({
            where: {
                serial_num: req.body.serial_num,
                unit_num: req.body.unit_num,
            },
        })
        .then(data => {
            if (data == null) {
                res.status(400).send({
                    message: 'User is not exist!'
                });

                return;
            }

            permission = data.permission;

            createUser();
            createDevice();

            res.send(true);
            return;
        })
        .catch(err => {
            res.status(500).send({
                message: err.message
            });

            return;
        });

    createUser = () => {
        const user = {
            name: req.body.name,
            serial_num: req.body.serial_num,
            unit_num: req.body.unit_num,
            permission: permission
        };

        User
        .create(user)
        .then(data => {
            console.log("User is created!");
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || 'Create user failure'
            });
        });
    }

    createDevice = () => {
        const device = {
            model_num: req.body.model_num,
            imei_num: req.body.imei_num,
            camera_active: req.body.camera_active,
            owner_num: req.body.serial_num,
        }

        Device
        .create(device)
        .then(data => {
            console.log("Device is crated!");
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || 'Create device failure'
            });
        });
    }
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
                name: req.body.name,
                serial_num: req.body.serial_num,
                unit_num: req.body.unit_num,
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