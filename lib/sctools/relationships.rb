require 'sctools/elements'

module SnomedCt

  class Relationships < Elements

    Type = [:defining,
            :qualifier,
            :historical,
            :additional]

    Refinability = [:not_refinable,
                    :optional,
                    :mandatory]

    def initialize(opts={})
      init_type_filter opts
      init_refinability_filter opts
    end

    def process(tuple)
      type = Type[tuple[4].to_i]
      if type_filter type
        refinability = Refinability[tuple[5].to_i]
        if refinability_filter refinability
          yield tuple[0], tuple[1], tuple[2], tuple[3], type, refinability, tuple[6].to_i
        end
      end
    end

    def init_type_filter(opts)
      @type_filter = make_filter opts, :type, Type
    end

    def type_filter(type)
      not @type_filter or @type_filter.include? type
    end

    def init_refinability_filter(opts)
      @refinability_filter = make_filter opts, :refinability, Refinability
    end

    def refinability_filter(refinability)
      not @refinability_filter or @refinability_filter.include? refinability
    end

  end

end
