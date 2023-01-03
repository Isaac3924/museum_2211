require 'rspec'
require './lib/exhibit'

RSpec.describe Exhibit do
    let(:exhibit) do
        Exhibit.new( { name: 'Gems and Minerals',
                       cost: 0 } )
    end


    describe '#initialize' do
        it "exists" do
            expect(exhibit).to be_instance_of(Exhibit)
        end

        it 'has attributes' do
            expect(exhibit.name).to eq("Gems and Minerals")
            expect(exhibit.cost).to eq(0)
        end
    end
end
