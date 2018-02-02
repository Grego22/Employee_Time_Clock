require 'rails_helper'

RSpec.describe User, type: :model do
	before do
		@user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Jon", last_name: "Snow")
	end
	describe "creation" do
  	it "can be created" do
  		expect(@user).to be_valid
  	end
  end

	describe "validation" do
		it "can be created" do
			expect(@user).to be_valid
		end

		it "cannot be created without first_name" do
			@user.first_name = nil
			expect(@user).to_not be_vali
		end

		it "cannot be created without last_name" do
			@user.last_name = nil
			expect(@user).to_not be_valid
    end

		it "cannot be created without phone" do
			@user.phone = nil
			expect(@user).to_not be_valid
    end

    it 'requires the phone attr to only contain integers' do
      @user.phone = 'mygreatstring'
      expect(@user).to_not be_valid
    end

    it 'requires the phone attr to only have 10 chars' do
			@user.phone = '12345678901'
			expect(@user).to_not be_valid
    end

    it "requires the ssn" do
			@user.ssn = nil
			expect(@user).to_not be_valid
    end

    it 'requires a company' do
			@user.company = nil
      expect(@user).to_not be_valid
    end
  end




	describe "custom name methods" do
		it 'has a full name method that combines first and last name' do
			expect(@user.full_name).to equal("SNOW, JON")
		end
  end
  describe 'relationship between admin and employees' do
		it "allows for admins to be associated with multiple employees" do
			employee_1 = FactoryBotRails.create(:user)
			employee_2 = FactoryBotRails.create(:user)
      admin = FactoryBotRails.create(:admin_user)
			Hand.create!(user_id: admin.id, hand_id: employee_1.id)
			Hand.create!(user_id: admin.id, hand_id: employee_2.id)
      expect(admin.hands.count). eq(2)

		end
	end
end