require 'rails_helper'

describe PrototypeImage do
  let(:prototypeImage){ build(:prototypeImage, :main) }

  describe 'validation' do
    it 'is valid' do
      expect(prototypeImage).to be_valid
    end

    it 'is invalid without status' do
      prototypeImage[:status] = nil
      expect(prototypeImage).not_to be_valid
    end

    it 'is invalid without image' do
      prototypeImage = build(:prototypeImage, :main, image: nil)
      prototypeImage[:image] = nil
      expect(prototypeImage).not_to be_valid
    end
  end

  describe 'association' do
    it 'associate with prototype' do
      prototype = build(:prototype)
      prototypeImage = build(:prototypeImage, prototype: prototype)
      expect(prototypeImage.prototype).to eq prototype
    end
  end
end
