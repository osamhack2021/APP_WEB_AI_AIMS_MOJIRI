const { Admin } = require('../models');
const { Op } = require('sequelize');
const request = require('request');

// Create User
// exports.signUp = (req, res) => {

// };

// admin login
exports.signIn = (req, res) => {
    console.log("Admin signIn access!");

	console.log(req.body);
	console.log(req.body.loginId);
	console.log(req.body.loginPw);

    Admin
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

        res.redirect("/users");
    })
    .catch(err => {
        res.status(500).send({
            message: err.message
        });

        return;
    });
}
