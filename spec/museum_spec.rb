require 'rspec'
require './lib/exhibit'
require './lib/patron'
require './lib/museum'

RSpec.describe Museum do
    let(:dmns) do
        Museum.new('Denver Museum of Nature and Science')
    end
    let(:gems_and_minerals) do
        Exhibit.new( { name: 'Gems and Minerals',
                       cost: 0 } )
    end
    let(:dead_sea_scrolls) do
        Exhibit.new( { name: 'Dead Sea Scrolls',
                       cost: 10 } )
    end
    let(:imax) do
        Exhibit.new( { name: 'IMAX',
                       cost: 15 } )
    end
    let(:patron_1) do
        Patron.new( { name: 'Bob',
                       spending_money: 0 } )
    end
    let(:patron_2) do
        Patron.new( { name: 'Sally',
                       spending_money: 20 } )
    end
    let(:patron_3) do
        Patron.new( { name: 'Johnny',
                       spending_money: 5 } )
    end

    describe '#initialize' do
        it "exists" do
            expect(dmns).to be_instance_of(Museum)
        end

        it 'has attributes' do
            expect(dmns.name).to eq("Denver Museum of Nature and Science")
            expect(dmns.exhibits).to eq([])
            expect(dmns.patrons).to eq([])
        end
    end

    describe '#add_exhibit' do
        it 'can add exhibits into the Museum exhibits array' do
            dmns.add_exhibit(gems_and_minerals)
            dmns.add_exhibit(dead_sea_scrolls)
            dmns.add_exhibit(imax)

            expect(dmns.exhibits).to eq([gems_and_minerals, dead_sea_scrolls, imax])
        end
    end

    describe '#recommend_exhibits' do
        it 'can create an array of exhibits for patrons to go visit' do
            patron_1.add_interest("Dead Sea Scrolls")
            patron_1.add_interest("Gems and Minerals")
            patron_2.add_interest("IMAX")

            dmns.add_exhibit(gems_and_minerals)
            dmns.add_exhibit(dead_sea_scrolls)
            dmns.add_exhibit(imax)

            expect(dmns.recommend_exhibits(patron_1)).to eq([gems_and_minerals, dead_sea_scrolls])
            expect(dmns.recommend_exhibits(patron_2)).to eq([imax])
        end
    end

    describe '#admit' do
        it 'can add partrons into the Museum patrons array' do
            dmns.admit(patron_1)
            dmns.admit(patron_2)
            dmns.admit(patron_3)

            expect(dmns.patrons).to eq([patron_1, patron_2, patron_3])
        end
    end

    describe '#partrons_by_exhibit_interest' do
        it 'can return hash of key of exhibits with value of array of interested patrons' do
            patron_1.add_interest("Gems and Minerals")
            patron_1.add_interest("Dead Sea Scrolls")
            patron_2.add_interest("Dead Sea Scrolls")
            patron_3.add_interest("Dead Sea Scrolls")
            
            dmns.admit(patron_1)
            dmns.admit(patron_2)
            dmns.admit(patron_3)

            expect(dmns.partrons_by_exhibit_interest).to eq( { gems_and_minerals: [patron_1], dead_sea_scrolls: [patron_1, patron_2, patron_3] }, imax: [] )
        end
    end
end