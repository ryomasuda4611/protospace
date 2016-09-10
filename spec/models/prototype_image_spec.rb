require 'rails_helper'

describe PrototypeImage do
  let(:prototype_image){ build(:prototype_image, :main) }

  describe 'validation' do
    it 'is valid' do
      expect(prototype_image).to be_valid
    end

    it 'is invalid without status' do
      prototype_image[:status] = nil
      expect(prototype_image).not_to be_valid
    end

    it 'is invalid without image' do
      prototype_image = build(:prototype_image, :main, image: nil)
      prototype_image[:image] = nil
      expect(prototype_image).not_to be_valid
    end
  end

  describe 'association' do
    it 'associate with prototype' do
      prototype = build(:prototype)
      prototype_image = build(:prototype_image, prototype: prototype)
      expect(prototype_image.prototype).to eq prototype
    end
  end
end
