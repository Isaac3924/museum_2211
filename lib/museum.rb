class Museum
    attr_reader :name,
                :exhibits

    def initialize(name, exhibits = [])
        @name = name
        @exhibits = exhibits
    end

    def add_exhibit(exhibit_name)
        @exhibits << exhibit_name
    end
end