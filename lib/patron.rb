class Patron
    attr_reader :name,
                :spending_money

    def initialize(info)
        @name = info[:name]
        @spending_money = info[:spending_money]
    end
end