require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/client")
require("./lib/stylist")
require('pg')

DB = PG.connect({:dbname => "hair_salon"})

get('/') do
  @stylists = Stylist.all()
  erb(:index)
end

post('/added_stylist') do
  name = params.fetch("name")
  Stylist.new({:name => name}).save()
  @stylists = Stylist.all()
  erb(:index)
end
