require 'nabatheon/version'
require 'nabatheon/entity'
require 'nabatheon/rule'
require 'nabatheon/search'

require 'stanford-core-nlp'

module Nabatheon
  BASE_DEP_PATH              = "#{File.expand_path('~')}/.stanford-nlp"
  StanfordCoreNLP.jar_path   = "#{BASE_DEP_PATH}/nlp/jars/stanford-core-nlp-full/"
  StanfordCoreNLP.model_path = "#{BASE_DEP_PATH}/nlp/models/"
  StanfordCoreNLP.log_file   = 'tmp/log.txt'
  StanfordCoreNLP.use :english
  Pipeline = StanfordCoreNLP.load(:tokenize, :ssplit, :pos, :lemma, :parse, :ner)

  def self.annotate(text)
    annotated_text = StanfordCoreNLP::Annotation.new(text)
    Pipeline.annotate(annotated_text)

    tagged = []
    annotated_text.get(:sentences).each do |sentence|
      sentence.get(:tokens).each do |token|
        entity_tag = token.get(:named_entity_tag).to_s
        lemma      = token.get(:lemma).to_s
        tagged << { named_entity: entity_tag, type: lemma }
      end
    end
    tagged
  end

  def self.relevant_searches_for(annotations)
    Rule.apply_on(annotations)
  end
end
