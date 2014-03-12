class Term
  attr_reader :words, :definitions

  @@terms = {}

  def initialize(word, definition)
    @words = [word]
    @definitions = [definition]

    @@terms[word.word] = self
  end

  def add(new_word, new_definition)
    @words << new_word
    @definitions << new_definition
  end

  def Term.search(word)
    @@terms[word]
  end

  def Term.all
    @@terms
  end

  def Term.del(term)
    @@terms.delete(term)
  end
end
