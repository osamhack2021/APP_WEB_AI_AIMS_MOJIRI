const db = require('../models/index.js')
const User = db.user;
const Op = db.sequelize.Op;

exports.create = (req, res) => {
    // Error case =============================
    if (!req.body.serial_num) {
        res.status(400).send({
            message: 'Serial Num is empty!'
        });

        return;
    }
    // ========================================

    // 1. 국방부 DB와 연계하여 조회 
    // input : serial_num / output : name, unit_num

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

exports.findAll = (req, res) => {
    const user = req.query.user;
    // let condition = { where: {} };

    // if (keyword) { 
    //     condition = { 
    //         where : {
    //             [Op.or]: [ 
    //                 { 
    //                     title: { 
    //                         [Op.like]: `%${keyword}%` 
    //                     } 
    //                 }, 
    //                 { 
    //                     description: { 
    //                     [Op.like]: `%${keyword}%` 
    //                     } 
    //                 } 
    //             ] 
    //         } 
    //     } 
    // };

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

