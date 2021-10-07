const { Soldier } = require('../models');
const { Op } = require('sequelize');
const request = require('request');

// Create User
exports.signUp = (req, res) => {
    console.log('signUp access');

    // Error case
    if (!req.body.serial_num || !req.body.unit_num || !req.body.name) {
        res.status(400).send({
            message: 'Specific Data is empty!'
        });

        return;
    }

    Soldier
    .findOne({
        where: {
            serial_num: req.body.serial_num,
            unit_num: req.body.unit_num,
        },
    })
    .then(async data => {
        if (data == null) {
            res.status(400).send({
                message: 'User is not exist!'
            });

            return;
        }

        var name = data.name;

        const userOptions = {
            uri: 'http://localhost:3000/users/create',
            method: 'POST',
            body: {
                name: name,
                serial_num: req.body.serial_num,
                unit_num: req.body.unit_num,
            },
            json: true
        }
    
        const deviceOptions = {
            uri: 'http://localhost:3000/devices/create',
            method: 'POST',
            body: {
                owner_num: req.body.serial_num,
                model_num: req.body.model_num,
                imei_num: req.body.imei_num,
                camera_active: req.body.camera_active,
            },
            json: true
        }
    
        var userResult = await request.post(userOptions);
        var deviceResult = await request.post(deviceOptions);

        if (!userResult || !deviceResult) {
            res.status(500).send({
                message: 'signUp User failure!'
            });

            return;
        }

        res.send('Success!');
    })
    .catch(err => {
        res.status(500).send({
            message: err.message
        });

        return;
    });
};

exports.signIn = (req, res) => {
    console.log("signIn access!");

    
}