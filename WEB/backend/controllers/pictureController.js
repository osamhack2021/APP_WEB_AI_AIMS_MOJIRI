const { spawn } = require('child_process');


exports.create = (req, res) => {
    console.log('enter');

    const python = spawn('python3', ['./print.py']);
    python.stdout.on('data', (data) => {
        console.log('Picture create access');

        console.log(data.toString());
        res.send(data.toString());
    })
};