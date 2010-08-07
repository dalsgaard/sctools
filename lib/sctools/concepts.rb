require 'sctools/components'

module SnomedCt

  class Concepts < Components

    def initialize(opts={})
      init_status_filter opts
    end

    def process(tuple)
      status = Status[tuple[1].to_i]
      if status_filter status
        name = tuple[2]
        yield tuple[0], status, name, suffix(name), tuple[5] == "1"
      end
    end

    def suffix(name)
      name  =~ /\(([a-z\/\-\s]+)\)$/
      $1
    end

  end

end
