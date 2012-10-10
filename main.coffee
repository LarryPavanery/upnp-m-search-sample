# node v0.8.11
dgram = require 'dgram'

message = new Buffer(
    "M-SEARCH * HTTP/1.1\r\n" +
    "HOST:239.255.255.250:1900\r\n" +
    "MAN:\"ssdp:discover\"\r\n" +
    "ST:ssdp:all\r\n" +
    "MX:1\r\n" +
    "\r\n"
)

socket = dgram.createSocket 'udp4'
socket.send message, 0, message.length, 1900, "239.255.255.250"
socket.on 'message', (buf, rinfo) ->
    console.log buf.toString('utf8')
    #console.log rinfo

setTimeout ()->
    console.log "finished"
    socket.close
,3000
