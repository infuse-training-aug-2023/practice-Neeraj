class HashManipulator
    attr_accessor :hash
  
    def initialize
      @hash = {}
    end
  
    def add_key_value_pair(key, value)
      @hash[key] = value
    end
  
    def select_odd_integer_keys
      @hash.select { |key, _| key.is_a?(Integer) && key.odd? }
    end
  end
  