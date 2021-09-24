require 'rails_helper'

RSpec.describe Product, type: :model do

	context "it is valid" do

	    it "must have a name" do

	    	p = Product.new
	    	p.name="Bicicleta Cromada"
	    	expect(p.valid?).to be_truthy

		end

	end

	context "it is not valid" do

	    it "won't have a name" do
	    	
	    	p = Product.new(name: nil)
	    	expect(p.valid?).to be_falsy

		end

	end
end
