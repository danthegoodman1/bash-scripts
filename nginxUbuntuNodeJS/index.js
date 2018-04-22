const express = require('express');

const PORT = 8080;
const HOST = '0.0.0.0';

startExpress = (host, port) => {
    app = express();
    app.get('/', (req, res) => {
        console.log("Request!");
        res.status(200).send(`Hello from Express running behind NGINX load balancer on port: ${port}!`);
    });
    app.listen(port, host, function(){
        console.log(`Started listneing at ${host} on port ${port}`);
    });
}

startExpress(HOST, PORT);
startExpress(HOST, PORT+1);
startExpress(HOST, PORT+2);
