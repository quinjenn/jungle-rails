require 'rails_helper'

  # validation tests/examples here
    #validates :name, presense: true
    #validates :price, presense: true
    #validates :quantity, presense: true
    #validates :category, presense: true
RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'is valid with all fields present' do
      category = Category.create(name: 'Plants')
      product = Product.new(name: 'Monstera Deliciosa', price: 39.99, quantity: 5, category: category)
      expect(product).to be_valid
    end

    it 'is invalid without a name' do
      category = Category.create(name: 'Plants')
      product = Product.new(name: nil, price: 39.99, quantity: 5, category: category)
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'requires a price' do
      category = Category.create(name: 'Plants')
      product = Product.new(name: 'Monstera Deliciosa', quantity: 5, category: category)
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it 'is invalid without a quantity' do
      category = Category.create(name: 'Plants')
      product = Product.new(name: 'Monstera Deliciosa', price: 39.99, quantity: nil, category: category)
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is invalid without a category' do
      category = Category.create(name: 'Plants')
      product = Product.new(name: 'Monstera Deliciosa', price: 39.99, quantity: 5, category: nil)
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end

