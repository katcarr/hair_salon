class Client
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes[:name]
    @id = attributes[:id]
  end

  define_method(:==) do |client_to_compare|
    @name == client_to_compare.name() && @id == client_to_compare.id()
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name) VALUES ('#{name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_singleton_method(:all) do
    clients = []
    client_results = DB.exec("SELECT * FROM clients ;")
    client_results.each() do |client|
      name = client.fetch("name")
      id =client.fetch("id").to_i()
      clients.push(Client.new({:name => name, :id => id}))
    end
    clients
  end
end
