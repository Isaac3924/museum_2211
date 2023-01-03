class Patron
    attr_reader :name,
                :spending_money,
                :interests

    def initialize(info, interests = [])
        @name = info[:name]
        @spending_money = info[:spending_money]
        @interests = interests
    end

    def add_interest(exhibit_name)
        @interests << exhibit_name
    end
end