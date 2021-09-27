var express = require('express');
var router = express.Router();

router.get('/', (req, res) => {
    console.log('hello user');
});

router.get('/signIn', (req, res) => {
    console.log('hello signIn');
})

router.post('/signIn', (req, res) => {
    console.log('hello signin');
});

module.exports = router;
