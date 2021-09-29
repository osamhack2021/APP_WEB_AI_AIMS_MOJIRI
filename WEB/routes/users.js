var express = require('express');
var mysql = require('mysql');
var dbconfig = require('../config/db.js');
var connection = mysql.createConnection(dbconfig);

var router = express.Router();

// create user
// 앱상에서 온 가입 요청을 확인한 뒤 DB에 추가
router.post('/signUp', (req, res) => {
    console.log(req.body);  // for test
    res.send("success");
});

// read user
// 관리자 페이지에서 유저들을 조회하기 위함
// router.get('/', (req, res) => {
//     console.log("get access");

// });

// update user
// 해당 User의 권한을 변경하기 위함
router.put('/:serial_num', (req, res) => {
    console.log("update access");
});

// delete user
// 해당 사용자 삭제
router.delete('/:serial_num', (req, res) => {
    console.log("delete access");
})

// DB connection test
router.get('/', (req, res) => {
    connection.query('SELECT * from Users', (error, rows) => {
        if (error) throw error;
        console.log('User info is : ', rows);
        res.send(rows);
    });
});

module.exports = router;