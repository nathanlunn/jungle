require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    context "password" do
      it "should be required to match password_confirmation" do 
        new_user = User.new(first_name: 'Nathan', last_name: 'Lunn', email: 'natelunn@gmail.com', password: '1234Pass!this', password_confirmation: '1324Pass!this')
        expect(new_user.save).to be_truthy
      end
    end
  end
end
