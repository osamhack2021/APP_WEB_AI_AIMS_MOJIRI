var express = require('express');
var mysql = require('mysql');
var dbconfig = require('../config/db.js');
var connection = mysql.createConnection(dbconfig);

var router = express.Router();

router.get('/', (req, res) => {
    connection.query('SELECT * from Users', (error, rows) => {
        if (error) throw error;
        console.log('User info is : ', rows);
        res.send(rows);
    });
});

router.get('/signIn', (req, res) => {
    console.log('hello signIn');
})

router.post('/signIn', (req, res) => {
    console.log('hello signin');
});

module.exports = router;
