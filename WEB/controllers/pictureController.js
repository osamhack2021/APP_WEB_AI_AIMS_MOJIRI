const { exec } = require('child_process');
const fs = require('fs');

exports.create = async (req, res) => {
    console.log('Image Access');

    // image save
    let decodeImg = Buffer.from(req.body.image, 'base64');
    fs.writeFileSync('./temp/target.jpg', decodeImg);

    // run AI code 
    await exec('/home/osam22/APP_WEB_AI_AIMS_MOJIRI/AI/run.sh /home/osam22/APP_WEB_AI_AIMS_MOJIRI/WEB/temp/target.jpg', (error, stdout, stderr) => {
        if (error !== null) {
            console.log(`exec error: ${error}`);
        } else {
            let readFile = fs.readFileSync('./temp/result.jpg');
            let encodeImg = Buffer.from(readFile).toString('base64');

            res.status(200).send(encodeImg);
        }
    });
}

//https://minu0807.tistory.com/46
//https://stackoverflow.com/questions/14573001/nodejs-how-to-decode-base64-encoded-string-back-to-binary
