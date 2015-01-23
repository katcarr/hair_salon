class Stylist
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes[:name]
    @id = attributes[:id]
  end

  define_method(:==) do |stylist_to_compare|
    @name == stylist_to_compare.name() && @id == stylist_to_compare.id()
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_singleton_method(:all) do
    stylists = []
    stylist_results = DB.exec("SELECT * FROM stylists ;")
    stylist_results.each() do |stylist|
      name = stylist.fetch("name")
      id = stylist.fetch("id").to_i()
      stylists.push(Client.new({:name => name, :id => id}))
    end
    stylists
  end
end
