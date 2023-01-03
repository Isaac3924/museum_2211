class Museum
    attr_reader :name,
                :exhibits

    def initialize(name, exhibits = [])
        @name = name
        @exhibits = exhibits
    end
end