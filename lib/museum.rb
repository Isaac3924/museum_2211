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

    def admit(patron)
        @patrons << patron
    end

    def partrons_by_exhibit_interest
        hash = {}

        @exhibits.each do |exhibit|
            hash[exhibit] =[]
        end

        @patrons.each do |patron|
            recommend_exhibits(patron).each do |exhibit|
                hash[exhibit] << patron
            end
        end

        hash
    end

    def ticket_lottery_contestants(exhibit)
        @patrons.find_all { |patron| patron.spending_money <
        exhibit.cost }
    end

    def draw_lottery_winner(exhibit)
        array = ticket_lottery_contestants(exhibit)

        return nil if array.empty?
        
        array.sample.name
    end

    def announce_lottery_winner(exhibit)
        winner = draw_lottery_winner(exhibit)

        if winner != nil
            "#{winner} has won the #{exhibit.name} exhibit lottery"

        else
            "No winners for this lottery"
        end
    end
end