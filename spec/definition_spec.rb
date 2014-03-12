require "rspec"
require "./lib/definition.rb"

describe Definition do
  describe "initialize" do
    it "creates an instance of definition with a hash with language as the key and definition as the value" do
      water = Definition.new("H20")
      water.definition.should eq "H20"
    end
    it "creates an instance but uses non-default language" do
      water = Definition.new("H20", "Spanish")
      water.language.should eq "Spanish"
    end
  end
end
