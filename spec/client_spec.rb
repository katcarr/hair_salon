(require "spec_helper")

describe(Client) do
  describe("#name") do
    it("returns the name of the client") do
      test_client = Client.new({:name => "Sue"})
      expect(test_client.name()).to(eq("Sue"))
    end
  end

  describe("#id") do
    it("returns the id of the client") do
      test_client = Client.new({:name => "Sue", :id => 3})
      expect(test_client.id()).to(eq(3))
    end
  end

  describe("#==") do
    it("returns true if name and id are same self and the client object argument") do
      test_client1 = Client.new({:name => "Sue", :id => 3})
      test_client2 = Client.new({:name => "Sue", :id => 3})
      expect(test_client1.==(test_client2)).to(eq(true))
    end
  end

  describe("#save") do
      it("saves itself to the table clients in the database DB") do
        test_client = Client.new({:name => "Sue", :id => 3})
        test_client.save()
        expect(Client.all()).to(eq([test_client]))
      end
  end

  describe(".all") do
    it("will return an array of all client objects that have been saved to DB") do
        test_client = Client.new({:name => "Sue", :id => 3})
        test_client.save()
        expect(Client.all()).to(eq([test_client]))
    end
  end






end
