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

    def recommend_exhibits(patron)
        @exhibits.select do |exhibit| 
           patron.interests.include?(exhibit.name)
        end
    end
end