require 'rails_helper'

describe User do
  let(:user){ FactoryGirl.build(:user) }

  it 'should be vaild' do
    expect(user).to be_valid
  end
end
