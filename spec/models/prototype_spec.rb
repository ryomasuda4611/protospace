require 'rails_helper'

describe Prototype do
  let(:prototype){ build(:prototype) }

  describe 'validation' do
    it 'is valid' do
    expect(prototype).to be_valid
    end

    %w{ title concept catch_copy }.each do |column_name|
      it { should validate_presence_of(column_name).with_message("can't be blank")}
    end
  end
end