
module SnomedCt

  class Elements

    def each(file_name, &block)
      File.open file_name do |file|
        file.set_encoding "utf-8"
        file.gets
        while line = file.gets
          tuple = line.strip.split "\t"
          process tuple, &block
        end
      end
    end

    def process(tuple)
      yield *tuple
    end

    def self.each(file_name, opts={}, &block)
      new(opts).each file_name, &block
    end

    def make_filter(opts, key, list)
      case filter = opts[key]
      when Symbol
        [filter]
      when String
        [filter.to_sym]
      when Integer
        [list[filter]]
      when Array
        filter.map do |item|
          case item
          when String
            item.to_sym
          when Integer
            list[item]
          else
            item
          end
        end
      else
        nil
      end
    end

  end

end
