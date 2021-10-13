const { exec } = require('child_process');

exports.create = async (req, res) => {

    // run AI code 
    await exec('/home/osam22/APP_WEB_AI_AIMS_MOJIRI/AI/run.sh /home/osam22/APP_WEB_AI_AIMS_MOJIRI/AI/images/image5.jpg', (error, stdout, stderr) => {
        if (error !== null) {
            console.log(`exec error: ${error}`);
        }

        console.log('picture done');
        res.status(200).send(true);
    });
}