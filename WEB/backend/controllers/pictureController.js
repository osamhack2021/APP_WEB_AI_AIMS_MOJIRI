const { exec } = require('child_process');

exports.create = (req, res) => {
    var base64 = req.body.image;
    var blob = Buffer.from(base64, "base64");


    // run AI code 
    exec('/home/osam22/APP_WEB_AI_AIMS_MOJIRI/AI/run.sh /home/osam22/APP_WEB_AI_AIMS_MOJIRI/AI/images/image5.jpg', (error, stdout, stderr) => {
        console.log(stdout);
        console.log(stderr);

        if (error !== null) {
            console.log(`exec error: ${error}`);
        }
    });
}