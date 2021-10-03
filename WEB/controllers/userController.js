const { User } = require('../models');
const { Device } = require('../models');
const { Soldier } = require('../models');
const { Op } = require('sequelize');

// Create User
exports.create = (req, res) => {
    // Error case
    if (!req.body.serial_num) {
        res.status(400).send({
            message: 'Serial Num is empty!'
        });
    
    if (!req.body.unit_num) {
        res.status(400).send({
            message: 'Unit Num is empty!'
        });
    }

        return;
    }
    
    // 1. 국방부 DB와 연계하여 조회 
    // input : serial_num / output : name, unit_num
    Soldier
        .findOne({
            where: {
                name: req.body.name,
                serial_num: req.body.serial_num,
                unit_num: req.body.unit_num,
            },
        })
        .then(data => {
            console.log(data);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || 'User is not exist'
            });
        });

    // 2. 이상없을 경우 회원가입 진행
    const user = {
        name: req.body.name,
        serial_num: req.body.serial_num,
        unit_num: req.body.unit_num,
        permission: 0
    };

    User
        .create(user)
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || 'Create user failure.'
            });
        });
};

// Read User all
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

// Read User one
exports.findOne = (req, res) => {
    User
        .findOne(req.params)
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || 'Retrieve user failure'
            });
        });
};