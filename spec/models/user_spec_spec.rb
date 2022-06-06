require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    context "password" do
      it "should be required to match password_confirmation for a user save" do 
        new_user = User.new(first_name: 'Nathan', last_name: 'Lunn', email: 'natelunn@gmail.com', password: "thispassword", password_confirmation: "differentpassword")
        new_user.save
        expect(new_user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      
      it "should be required to exist for a user save" do 
        new_user = User.new(first_name: 'Nathan', last_name: 'Lunn', email: 'natelunn@gmail.com', password: nil, password_confirmation: "differentpassword")
        new_user.save
        expect(new_user.errors.full_messages).to include("Password can't be blank")
      end

      it "should have to be at least 8 characters long for a user save" do
        password = 'this'
        new_user = User.new(first_name: 'Nathan', last_name: 'Lunn', email: 'natelunn@gmail.com', password: password, password_confirmation: password)
        new_user.save
        expect(new_user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
      end
    end

    context "email" do
      it "should have to be unique for a user save" do
        password1 = 'thispassword'
        user1 = User.new(first_name: 'Bob', last_name: 'Dylan', email:'TEST@TEST.com', password: password1, password_confirmation: password1)
        user1.save
        
        password2 = 'thisspassword'
        user2 = User.new(first_name: 'Beth', last_name: 'Butcher', email: 'test@test.COM', password: password2, password_confirmation: password2)
        user2.save
        expect(user2.errors.full_messages).to include("Email has already been taken")
      end

      it "should have to exist for a user save" do
        password = 'thispassword'
        new_user = User.new(first_name: 'Bob', last_name: 'Dylan', email:nil, password: password, password_confirmation: password)
        new_user.save
        expect(new_user.errors.full_messages).to include("Email can't be blank")
      end
    end

    context "first_name" do
      it "should have to exist for a user save" do
        password = 'thispassword'
        new_user = User.new(first_name: nil, last_name: 'Dylan', email: "TEST@TEST.com", password: password, password_confirmation: password)
        new_user.save
        expect(new_user.errors.full_messages).to include("First name can't be blank")
      end
    end

    context "last_name" do
      it "should have to exist for a user save" do
        password = 'thispassword'
        new_user = User.new(first_name: 'Bob', last_name: nil, email: "TEST@TEST.com", password: password, password_confirmation: password)
        new_user.save
        expect(new_user.errors.full_messages).to include("Last name can't be blank")
      end
    end
  end

  describe '.authenticate_with_credentials' do
    it "should return nil if a user with inputed password doesn't exist" do
      password = 'thispassword'
        new_user = User.new(first_name: 'Nathan', last_name: 'Lunn', email: 'natelunn@gmail.com', password: password, password_confirmation: password)
        new_user.save
        result = User.authenticate_with_credentials('natelunn@gmail.com', 'differentpassword')
        expect(result).to eq(nil)
    end
    
    it "should return nil if a user with inputed email doesn't exist" do
      password = 'thispassword'
        new_user = User.new(first_name: 'Nathan', last_name: 'Lunn', email: 'natelunn@gmail.com', password: password, password_confirmation: password)
        new_user.save
        result = User.authenticate_with_credentials('nateluffasdnn@gmail.com', password)
        expect(result).to eq(nil)
    end
  end
end
