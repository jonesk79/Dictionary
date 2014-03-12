require "rspec"
require "./lib/term.rb"
require "./lib/word.rb"
require "./lib/definition.rb"

describe Term do
  describe "initialize" do
    it "creates an instance of Term that has a word and definition variable passed in" do
      judo_word = Word.new("Judo")
      judo_definition = Definition.new("A martial art.")
      judo_term = Term.new(judo_word, judo_definition)

      judo_term.should be_an_instance_of Term
      judo_term.words.should eq [judo_word]
      judo_term.definitions.should eq [judo_definition]
    end

    describe "add" do
      it "adds a word to term" do
        water_word = Word.new("Water")
        water_definition = Definition.new("Dihydrogen Monoxide")
        water_term = Term.new(water_word, water_definition)

        agua_word = Word.new("Agua", "Spanish")
        agua_definition = Definition.new("El Dihydrogen Monoxide")

        water_term.add(agua_word, agua_definition)
        water_term.words.should eq [water_word, agua_word]
        water_term.definitions.should eq [water_definition, agua_definition]
      end
    end

    describe "Term.search" do
      it "Searches through the class variable @@terms for 'word' as a key" do
        water_word = Word.new("Water")
        water_definition = Definition.new("Dihydrogen Monoxide")
        water_term = Term.new(water_word, water_definition)

        Term.search("Water").should eq water_term
      end
    end
  end
end
