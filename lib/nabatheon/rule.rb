module Nabatheon
  class Rule
    PERSON = 'PERSON'
    ORG    = 'ORGANIZATION'

    def self.apply_on(*args)
      self.new.apply_on(*args)
    end

    def apply_on(named_entities)
      searches = []
      previous = Entity.new(nil, nil)
      named_entities.map do |entity_arr|
        entity = Entity.new(entity_arr[:named_entity], entity_arr[:type])
        if rule_of_two?(entity.type, previous.type)
          searches.last.value = "#{searches.last.value} #{entity.value}"
        else
          searches << Search.new(entity.type, entity.value)
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
      (type          == PERSON || type          == ORG) && \
      (previous_type == PERSON || previous_type == ORG)
    end
  end
end
