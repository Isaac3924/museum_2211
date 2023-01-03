class Museum
    attr_reader :name,
                :exhibits,
                :patrons

    def initialize(name, exhibits = [], patrons = [])
        @name = name
        @exhibits = exhibits
        @patrons = patrons
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