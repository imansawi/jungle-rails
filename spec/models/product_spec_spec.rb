require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validation' do
    describe 'all 4 four fields are available' do
      it 'would save succssfully' do
        @category = Category.new(name: 'apparel')
        @category.save!
        @product = @category.products.new(name: 'Red bookshelf', quantity: 2, description: 'description', price: 300)
        @product.save!
        expect(@product.id).to be_present

      end      
    end

    describe 'product name is missing' do
      it 'generate an error' do
        @category = Category.new(name: 'apparel')
        @category.save!
        @product = @category.products.new(name: '', quantity: 2, description: 'description', price: 300)
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages[0]).to eq("Name can't be blank")
      end      
    end

    describe 'product price is missing' do
      it 'generate an error' do
        @category = Category.new(name: 'apparel')
        @category.save!
        @product = @category.products.new(name: 'Red bookshelf', quantity: 2)
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages[0]).to eq("Price cents is not a number")
      end      
    end

    describe 'product quantity is missing' do
      it 'generate an error' do
        @category = Category.new(name: 'apparel')
        @category.save!
        @product = @category.products.new(name: 'Red bookshelf', price: 2)
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include("Quantity can't be blank")
      end      
    end

    describe 'product category is missing' do
      it 'generate an error' do
        #@category = Category.new(name: 'apparel')
        #@category.save!
        @product = Product.new(name: 'Red bookshelf', price: 2, quantity: 2 )
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end      
    end

  end
end