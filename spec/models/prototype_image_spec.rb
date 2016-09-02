require 'rails_helper'

describe PrototypeImage do
  let(:prototype_image){ build(:prototype_image, :main) }

  describe 'validation' do
    it 'is valid' do
      expect(prototype_image).to be_valid
    end
    it {should validate_presence_of(:image).with_message("can't be blank")}
    it {should validate_presence_of(:status).with_message("can't be blank")}
  end
end
