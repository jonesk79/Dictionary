require "rspec"
require "./lib/word.rb"

describe Word do
  describe "initialize" do
    it "creates an instance of word with @word equal to word, and English as default language" do
      water = Word.new("water")
      water.word.should eq "water"
      water.language.should eq "English"
    end

    it "Creates instance, but uses non-default language" do
      water = Word.new("agua", "Spanish")
      water.word.should eq "agua"
      water.language.should eq "Spanish"
    end
  end
end
