const { readdirSync, rename } = require('fs');
const {resolve} = require('path');

const imageDirPath = resolve(__dirname, './test_metadata/');

const files = readdirSync(imageDirPath);


const old = "./test_metadata/"


let counter = 1;

while (files.length != 0){
    let y = Math.floor(Math.random() * (files.length - 1));
    console.log(y);

    rename(old + files[y], old + "" + String(counter) + ".json", (err) => {
        if (err) console.log(err)
    })

    counter = counter + 1;
    files.splice(y, 1);
}