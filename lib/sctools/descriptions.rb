require 'sctools/components'

module SnomedCt

  class Descriptions < Components

    Type = [:unspecified,
            :preferred,
            :synonym,
            :fully_specified_name]

    def initialize(opts={})
      init_status_filter opts
      init_type_filter opts
    end

    def process(tuple)
      status = Status[tuple[1].to_i]
      if status_filter status
        type = Type[tuple[5].to_i]
        if type_filter type
          cap = (tuple[4] == "0") ? :variable : :fixed
          tuple[6] =~ /^([a-z]{2})(\-([A-Z]{2}))?$/
          lang = $1 ? $1.to_sym : nil
          dia = $3 ? $3.to_sym : nil
          yield tuple[0], status, tuple[2], tuple[3], cap, type, lang, dia
        end
      end
    end

    def type_filter(type)
      not @type_filter or @type_filter.include? type
    end

    def init_type_filter(opts)
      @type_filter = make_filter opts, :type, Type
    end

  end

end
