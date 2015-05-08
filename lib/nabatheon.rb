require 'nabatheon/version'
require 'stanford-core-nlp'

module Nabatheon
  BASE_DEP_PATH              = "#{File.expand_path('~')}/.stanford-nlp"
  StanfordCoreNLP.jar_path   = "#{BASE_DEP_PATH}/nlp/jars/stanford-core-nlp-full/"
  StanfordCoreNLP.model_path = "#{BASE_DEP_PATH}/nlp/models/"
  StanfordCoreNLP.log_file   = 'tmp/log.txt'
  StanfordCoreNLP.use :english
  Pipeline = StanfordCoreNLP.load(:tokenize, :ssplit, :pos, :lemma, :parse, :ner)

  def self.annotate(raw_text)
    text = StanfordCoreNLP::Annotation.new(raw_text)
    Pipeline.annotate(text)

    named_lemma = []
    text.get(:sentences).each do |sentence|
      sentence.get(:tokens).each do |token|
        entity_tag = token.get(:named_entity_tag).to_s
        lemma      = token.get(:lemma).to_s
        named_lemma << [entity_tag, lemma] unless entity_tag == 'O'
      end
    end
    puts named_lemma.inspect
  end
end
