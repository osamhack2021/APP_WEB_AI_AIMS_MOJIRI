const { Device } = require('../models');
const { Op } = require('../models');

// Create Device
exports.create = (req, res) => {
    console.log('Device create access');

    if (!req.body.owner_num || !req.body.model_num || !req.body.imei_num) {
        res.status(400).send({
            message: 'Specific Data is empty!'
        });

        return;
    }

    const device = {
        owner_num: req.body.owner_num,
        model_num: req.body.model_num,
        imei_num: req.body.imei_num,
        camera_active: req.body.camera_active,
    }

    Device
    .create(device)
    .then(data => {
        console.log("Device is created!");
        
        res.status(200).send(true);
        return;;
    })
    .catch(err => {
        res.status(500).send({
            message: err.message || 'Create device failure'
        });

        return;
    });
};
