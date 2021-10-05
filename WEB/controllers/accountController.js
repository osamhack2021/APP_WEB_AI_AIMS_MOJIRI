const { Soldier } = require('../models');
const { Op } = require('sequelize');
const request = require('request');

// Create User
exports.create = (req, res) => {
    console.log('account create access');

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
        var permission = data.permission;

        const userOptions = {
            uri: 'http://localhost:3000/users/create',
            method: 'POST',
            body: {
                name: name,
                serial_num: req.body.serial_num,
                unit_num: req.body.unit_num,
                permission: permission,
            },
            json: true
        }
    
        const deviceOptions = {
            uri: 'http://localhost:3000/devices/create',
            method: 'POST',
            body: {
                model_num: req.body.model_num,
                imei_num: req.body.imei_num,
                camera_active: req.body.camera_active,
                serial_num: req.body.serial_num,
            },
            json: true
        }
    
        await request.post(userOptions);
        await request.post(deviceOptions);
    
        res.send('Success!');

    })
    .catch(err => {
        res.status(500).send({
            message: err.message
        });

        return;
    });
};