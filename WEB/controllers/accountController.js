const { Soldier } = require('../models');
const { Admin } = require('../models');
const { User } = require('../models');
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
    .then(data => {
        if (data == null) {
            res.status(400).send({
                message: 'User is not exist!'
            });

            return;
        }

        var name = data.name;
        var pledge = JSON.stringify(req.body.pledge);

        const userOptions = {
            uri: 'http://localhost:3000/users/create',
            method: 'POST',
            body: {
                name: name,
                serial_num: req.body.serial_num,
                unit_num: req.body.unit_num,
                security_pledge: pledge,
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

        request.post(userOptions, (error, response, body) => {
            if (response.statusCode == 500) {
                console.log('Error occur!');
                
                res.status(500).send(false);
                return;
            }

            request.post(deviceOptions, (error, response, body) => {
                if (response.statusCode == 500) {
                    console.log('Error occur!');

                    res.status(500).send(false);
                    return;
                }

                console.log('SignUp done!');
                res.send(true);
            });
        });
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

    User
    .findOne({
        where: {
            serial_num: req.body.loginId,
            password: req.body.loginPw,
        },
    })
    .then(data => {
        if (data == null) {
            res.status(400).send({
                message: 'Admin is not exist!'
            });

            return;
        }

        res.status(200).send(true);
    })
    .catch(err => {
        res.status(500).send({
            message: err.message
        });

        return;
    });
}