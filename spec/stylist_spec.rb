(require "spec_helper")

describe(Stylist) do
  describe("#name") do
    it("returns the name of the stylist") do
      test_stylist = Stylist.new({:name => "Mark"})
      expect(test_stylist.name()).to(eq("Mark"))
    end
  end

  describe("#id") do
    it("returns the id of the stylist") do
      test_stylist = Stylist.new({:name => "Mark", :id => 3})
      expect(test_stylist.id()).to(eq(3))
    end
  end

  describe("#==") do
    it("returns true if name and id are same as self and the stylist object argument") do
      test_stylist1 = Stylist.new({:name => "Mark", :id => 3})
      test_stylist2 = Stylist.new({:name => "Mark", :id => 3})
      expect(test_stylist1.==(test_stylist2)).to(eq(true))
    end
  end

  describe("#save") do
    it("saves itself to the table stylists in the database DB") do
      test_stylist = Stylist.new({:name => "Mark", :id => 3})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end

    it("writes to id the id it was assinged in the database ") do
      test_stylist = Client.new({:name => "Mark", :id => nil})
      test_stylist.save()
      expect(test_stylist.id()).to(be_an_instance_of(Fixnum))
    end

  end

  describe(".all") do
    it("will return an array of all stylist objects that have been saved to DB") do
      test_stylist = Stylist.new({:name => "Mark", :id => 3})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end
end
