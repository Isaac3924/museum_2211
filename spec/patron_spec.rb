require 'rspec'
require './lib/patron'

RSpec.describe Patron do
    let(:patron_1) do
        Patron.new( { name: 'Bob',
                       age: 20 } )
    end

    describe '#initialize' do
        it "exists" do
            expect(patron_1).to be_instance_of(Patron)
        end
    end
end