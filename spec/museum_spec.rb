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

        it 'has attributes' do
            expect(dmns.name).to eq("Denver Museum of Nature and Science")
            expect(dmns.exhibits).to eq([])
        end
    end

    # describe '#add_interest' do
    #     it 'can add exhibits into the Patron interests array' do
    #         patron_1.add_interest("Dead Sea Scrolls")
    #         patron_1.add_interest("Gems and Minerals")

    #         expect(patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
    #     end
    # end
end