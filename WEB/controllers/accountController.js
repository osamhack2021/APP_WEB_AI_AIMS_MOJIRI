const { Soldier } = require('../models');
const { User } = require('../models');
const { Device } = require('../models');
const { Op } = require('sequelize');
const request = require('request');

// Create User
exports.signUp = (req, res) => {
    console.log('User SignUp access!');

    // Error case
    if (!req.body.serial_num || !req.body.unit_num || !req.body.name) {
        res.status(400).send({
            message: 'Specific Data is empty!'
        });

        return;
    }
        
    const userOptions = {
        uri: 'http://localhost:3000/users/create',
        method: 'POST',
        body: {
            name: req.body.name,
            serial_num: req.body.serial_num,
            unit_num: req.body.unit_num,
            device_num: req.body.imei_num,
            security_pledge: req.body.pledge,
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

            res.send(true);
        });
    });
}

// login User
exports.signIn = (req, res) => {
    console.log('User signIn access');

    User
    .findOne({
        where: {
            serial_num: req.body.serial_num,
            unit_num: req.body.unit_num,
        },
    })
    .then(data => {
        if (data == null) {
            res.status(400).send('User is not exist');

            return;
        }

        Device
        .findOne({
            where: {
                owner_num: req.body.serial_num,
                imei_num: req.body.imei_num,
            },
        })
        .then(data => {
            if (data == null) {
                res.status(400).send('Device is not exist');
                return;
            } else {
                res.status(200).send(true);
                return;
            }
        })
    })
    .catch(err => {
        res.status(500).send({
            message: err.message
        });

        return;
    });
}

exports.findInfo = (req, res) => {
    console.log('User findInfo access');

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

        res.status(200).send({name: data.name, rank: data.rank});
    })
    .catch(err => {
        res.status(500).send({
            message: err.message
        });

        return;
    });
};