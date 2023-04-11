require 'rails_helper'

    #validates :first_name, presence: true
    #validates :last_name, presence: true
    #validates :email, presence: true, uniqueness: { case_sensitive: false }
    #validates :password, presence: true, length: { minimum: 6 }, confirmation: true
    #validates :password_confirmation, presence: true
RSpec.describe User, type: :model do
  describe 'Validations' do
    it "passes validation for valid input" do 
      user = User.new(first_name: 'Jennifer', last_name: 'Quintal', email: 'jenn@test.com', password: 'password', password_confirmation: 'password')
      expect(user).to be_valid
    end

    it 'is invalid without a first name' do
      user = User.new(first_name: nil, last_name: 'Quintal', email: 'jenn@test.com', password: 'password', password_confirmation: 'password')
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    it 'is invalid without a last name' do
      user = User.new(first_name: 'Jennifer', last_name: nil, email: 'jenn@test.com', password: 'password', password_confirmation: 'password')
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'is invalid without an email' do
      user = User.new(first_name: 'Jennifer', last_name: 'Quintal', email: nil, password: 'password', password_confirmation: 'password')
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'is invalid with a non-unique email' do
      user1 = User.create(first_name: 'Jennifer', last_name: 'Quintal', email: 'jenn@test.com', password: 'password', password_confirmation: 'password')
      user1.save
      user2 = User.create(first_name: 'Jennifer', last_name: 'Quintal', email: 'jenn@test.com', password: 'password', password_confirmation: 'password')
      expect(user2).not_to be_valid
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'is invalid with mismatching password and password confirmation' do
      user = User.create(first_name: 'Jennifer', last_name: 'Quintal', email: 'jenn@test.com', password: 'password', password_confirmation: 'password')
      user.password_confirmation = 'different_password'
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'is invalid with a password that is too short' do
      user = User.create(first_name: 'Jennifer', last_name: 'Quintal', email: 'jenn@test.com', password: 'password', password_confirmation: 'password')
      user.password = 'pass'
      user.password_confirmation = 'pass'
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end
end