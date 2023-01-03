class Patron
    attr_reader :name,
                :age

    def initialize(info)
        @name = info[:name]
        @age = info[:age]
    end
end