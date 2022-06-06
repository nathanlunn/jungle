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
        new_product = Product.new(price: 4000, quantity: 7, category_id: new_category)

        expect(new_product.save).to be_falsey
      end
    end
    
    context "omitting price" do
      it "results in a save failure" do
        new_category = Category.new(name: 'that')
        new_product = Product.new(name: 'this', quantity: 7, category_id: new_category)

        expect(new_product.save).to be_falsey
      end
    end

    context "omitting quantity" do
      it "results in a save failure" do
        new_category = Category.new(name: 'that')
        new_product = Product.new(name: 'this', price: 4000, category_id: new_category)

        expect(new_product.save).to be_falsey
      end
    end

    context "omitting category" do
      it "results in a save failure" do
        new_product = Product.new(name: 'this', price: 4000, quantity: 7)

        expect(new_product.save).to be_falsey
      end
    end
  end
end
