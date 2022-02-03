const port = 3000
const express = require('express')

const app = express()
app.use(express.static(`${__dirname}/public`))

app.listen(port, () => {
    console.log(`Express server listening on port ${port}`)
})






/*const http = require("http");
const fs = require('fs').promises;

const app = require("./app")
app.use(express.static('public'));

const host = 'localhost';
const port = 8000;

let indexFile;

const requestListener = function (req, res) {
    res.setHeader("Content-Type", "text/html");
    res.writeHead(200);
    res.end(indexFile);
};

const server = http.createServer(requestListener);

fs.readFile(__dirname+"/index.html")
    .then(contents => {
        indexFile = contents;
        server.listen(port,host,() => {})
    })
    .catch(err => {
        process.exit(1);
    })
*/
