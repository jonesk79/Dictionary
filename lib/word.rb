class Word
  attr_reader :word, :language

  def initialize(word, language = "English")
    @word = word
    @language = language
    # @part_of_speech
  end
end
