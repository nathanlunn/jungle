require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    context "product" do
      it "can be saved when given name, price, quantity and category id" do
        new_category = Category.new(name: 'that')
        @new_product = Product.new(name: 'this', price: 4000, quantity: 7, category: new_category)

        expect(@new_product.save).to be_truthy
      end
    end
    
    context "omitting name" do
      it "results in a save failure" do
        new_category = Category.new(name: 'that')
        new_product = Product.new(price: 4000, quantity: 7, category: new_category)
        new_product.save

        expect(new_product.errors.full_messages).to include("Name can't be blank")
      end
    end
    
    context "omitting price" do
      it "results in a save failure" do
        new_category = Category.new(name: 'that')
        new_product = Product.new(name: 'this', quantity: 7, category: new_category)
        new_product.save

        expect(new_product.errors.full_messages).to include("Price can't be blank")
      end
    end

    context "omitting quantity" do
      it "results in a save failure" do
        new_category = Category.new(name: 'that')
        new_product = Product.new(name: 'this', price: 4000, category: new_category)
        new_product.save

        expect(new_product.errors.full_messages).to include("Quantity can't be blank")
      end
    end

    context "omitting category" do
      it "results in a save failure" do
        new_product = Product.new(name: 'this', price: 4000, quantity: 7)
        new_product.save

        expect(new_product.errors.full_messages).to include("Category can't be blank")
      end
    end
  end
end
