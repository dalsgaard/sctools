require 'sctools/elements.rb'

module SnomedCt

  class Components < Elements

    Status = [:current,
              :retired,
              :duplicate,
              :outdated,
              :ambiguous,
              :erroneous,
              :limited,
              :inappropriate,
              :concept_retired,
              :implied,
              :moved_elsewhere,
              :pending_move]
    
    def process(tuple)
      status = Status[tuple[1].to_i]
      if status_filter status
        tuple[1] = status
        yield *tuple
      end
    end

    def init_status_filter(opts)
      @status_filter = make_filter opts, :status, Status
    end

    def status_filter(status)
      not @status_filter or @status_filter.include? status
    end

  end

end
