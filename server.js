var express = require('express'),
    http    = require('http'),
    sqllite = require('sqlite3'),
    nowjs   = require('now'),
    fs      = require('fs'),
    execSync = require('execSync');

var PORT = 8000;
var dirContent;
var cmdOut = 0;

var app = express.createServer();
app.configure(function(){
    app.use(express.bodyParser());
    app.use(express.static(__dirname + '/public'));
});

var server = http.createServer(app)
server.listen(PORT);
console.log('Server running at http://127.0.0.1:' + PORT);

var everyone = nowjs.initialize(server);

everyone.now.update = function(){
    this.now.showDirContent(dirContent);
}

everyone.now.execute = function(cmd){
    cmd = '/var/www/scripts/' + cmd
    cmdOut = execSync.stdout(cmd);
    this.now.updateOutput(cmdOut);
}
nowjs.on('connect', function(){
    console.log("Reaeding the contents of /var/www");
    dirContent = fs.readdirSync('/var/www/scripts');
    this.now.update();
});

nowjs.on('disconnect', function(){
    console.log("Bye Bye! Server exiting");
});
