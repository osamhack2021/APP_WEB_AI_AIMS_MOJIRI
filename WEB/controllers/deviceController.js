const { Device } = require('../models');
const { Op } = require('../models');

// Create Device
exports.create = (req, res) => {
    if (!req.body.model_num || !req.body.imei_num || !req.body.camera_active) {
        res.status(400).send({
            message: 'Specific Data is empty!'
        });

        return;
    }

    const device = {
        model_num: req.body.model_num,
        imei_num: req.body.imei_num,
        camera_active: req.body.camera.active,
        owner_num: req.body.serial_num,
    }

    Device
    .create(device)
    .then(data => {
        console.log("Device is created!");
    })
    .catch(err => {
        res.status(500).send({
            message: err.message || 'Create device failure'
        });
    });
};
