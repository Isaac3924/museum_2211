require 'rspec'
require './lib/exhibit'
require './lib/patron'
require './lib/museum'

RSpec.describe Museum do
    let(:dmns) do
        Museum.new('Denver Museum of Nature and Science')
    end
    let(:exhibit) do
        Exhibit.new( { name: 'Gems and Minerals',
                       cost: 0 } )
    end
    let(:patron_1) do
        Patron.new( { name: 'Bob',
                       spending_money: 20 } )
    end

    describe '#initialize' do
        it "exists" do
            expect(dmns).to be_instance_of(Museum)
        end

        # it 'has attributes' do
        #     expect(patron_1.name).to eq("Bob")
        #     expect(patron_1.spending_money).to eq(20)
        #     expect(patron_1.interests).to eq([])
        # end
    end

    # describe '#add_interest' do
    #     it 'can add exhibits into the Patron interests array' do
    #         patron_1.add_interest("Dead Sea Scrolls")
    #         patron_1.add_interest("Gems and Minerals")

    #         expect(patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
    #     end
    # end
end