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

  describe 'association' do
    it{should belong_to(:user)}

    it{should have_many(:likes).dependent(:destroy)}

    it{should have_many(:prototype_images).dependent(:destroy)}
  end
end
