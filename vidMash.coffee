request = require 'request'

`Array.prototype.unique = function() {    var o = {}, i, l = this.length, r = [];    for(i=0; i<l;i+=1) o[this[i]] = this[i];    for(i in o) r.push(o[i]);    return r;};`

alistApp = require('zappa').app ->
  @use 'bodyParser', 'static', 'cookies', 'cookieParser', session: {secret: 'secronSecret'}

  crypto = require('crypto')
 
  @get '/': ->
    @render index: {}

 
 
port = if process.env.PORT > 0 then process.env.PORT else 3000
alistApp.app.listen port
console.log "starting on port # #{port}"
