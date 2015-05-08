module Nabatheon
  class Rule
    PERSON = 'PERSON'
    ORG    = 'ORGANIZATION'

    def self.apply(*args)
      self.new.apply(*args)
    end

    def apply(named_entities)
      searches = []
      previous = {}
      named_entities.map do |entity|
        value = entity[:named_entity]
        type  = entity[:type]
        if rule_of_two?(type, previous[:type])
          searches.last.value = "#{searches.last.value} #{value}"
        else
          searches << Searches.new(type, value)
        end
        previous = entity
      end
      searches
    end

    # * (2 persons || 2 orgs) in a row => #contact
    def rule_of_two?(type, previous_type)
      # FIXME: Does not return correct value if if the types are:
      #        type = PERSON && previous[:type] = ORG
      #        # => returns true
      (type            == PERSON || type            == ORG) && \
      (previous[:type] == PERSON || previous[:type] == ORG)
    end
  end
end
