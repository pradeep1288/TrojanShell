##What is GupShup?

gupshup is a lightweight group chat application written with node.js. 

## Dependencies

To get this running, you need to have the following installed

* [node.js](http://nodejs.org/) 
* [now](http://nowjs.com/)
* [sqlite3](http://www.sqlite.org/)
* [node-sqlite3](https://github.com/developmentseed/node-sqlite3)

## Start Using

* Download the gupshup chat app from [here](https://github.com/pradeep1288/gupshup/zipball/master)
* Extract the zip contents to a directory
* Navigate to the directory where you extracted the contents
* Run `node server.js`
* You have now started the chat server. Clients can join in via http://servers-ip-here:8000 :)

## Delete all the old chatlogs

Currently there is no admin interface. For now follow the following instructions
* Navigate to the directory where you had extracted gupshup
* `sqlite3 chat.db`
* `delete from chatlog;`

## License

[Creative Commons](http://creativecommons.org/licenses/by-nc-sa/3.0/)