const http = require("http");
http.createServer(function(req,res){
    console.log("hey!")
    res.writeHead("200",{"Content-Type":"text/html","X-BRUH":"hi"})
    res.write("<h1>hi</h1>")
    return res.end()
}).listen(80)