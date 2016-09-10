require 'rails_helper'

describe User do
  let(:user){ build(:user) }

  decribe 'Validation' do
    it 'should be vaild' do
      expect(user).to be_valid
    end
    it "is invalid without email " do
      user[:email] = ''
      user.valid?
      expect(user.errors[:email]).to be_present
      end

    it "is invalid without username" do
      user[:username] = ''
      user.valid?
      expect(user.errors[:username]).to be_present
    end

    it "is invalid without a password" do
        user = build(:user, password: nil )
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without a password_confirmation" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "is invalid with duplicate email adresses" do
      user = create(:user)
      another_user = build(:user, email: user[:email])
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "is invalid with a password taht has less than 6 characters" do
      user = build(:user, password: "a" * 5, password_confirmation: "a" * 5)
      user.valid?
      expect(user.errors[:password][0]).to include("is too short")
    end
  end
end
