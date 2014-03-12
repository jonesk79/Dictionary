class Definition
  attr_reader :definition, :language

  def initialize(definition, language = "English")
    @definition = definition
    @language = language
  end
end
