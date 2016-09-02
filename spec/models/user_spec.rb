require 'rails_helper'

describe User do
  let(:user){ build(:user) }

  it 'should be vaild' do
    expect(user).to be_valid
  end
  it "is invalid without email " do
    user[:email] = ''
    expect(user).not_to be_valid
    expect(user.errors[:email]).to be_present
    end

  it "is invalid without username" do
    user[:username] = ''
    expect(user).not_to be_valid
    expect(user.errors[:username]).to be_present
  end

  it "is invalid without a password" do
      user = build(:user, password: nil )
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include("can't be blank")
  end

  it "is invalid without a password_confirmation" do
    user = build(:user, password_confirmation: "")
    expect(user).not_to be_valid
    expect(user.errors[:password_confirmation]).to include("doesn't match Password")
  end
end
