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
  stylist_to_add = Stylist.new({:name => name})
  stylist_to_add.save()
  @stylists = Stylist.all()
  erb(:index)
end

get('/stylist/:id') do
  id = params.fetch("id").to_i()
  result = DB.exec("SELECT * FROM stylists WHERE id = #{id};")
  name = result.first().fetch('name')
  @stylist = Stylist.new({:name => name, :id => id})
  @clients = @stylist.clients()
  erb(:stylist)
end

post('/added_client') do
  stylist_id = params.fetch("stylist_id").to_i()
  result = DB.exec("SELECT * FROM stylists WHERE id = #{stylist_id};")
  name = result.first().fetch('name')
  @stylist = Stylist.new({:name => name, :id => stylist_id})
  name = params.fetch("name")
  client_to_add = Client.new({:name => name})
  client_to_add.save()
  @stylist.add_client(client_to_add)
  @clients = @stylist.clients()

  erb(:stylist)
end
