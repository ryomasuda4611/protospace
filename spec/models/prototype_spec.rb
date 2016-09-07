require 'rails_helper'

describe Prototype do
  describe 'validation' do
    let(:prototype){ build(:prototype) }
    it 'is valid' do
      expect(prototype).to be_valid
    end

    %w{ title concept catch_copy }.each do |column_name|
      it { should validate_presence_of(column_name).with_message("can't be blank") }
    end
  end

  describe 'association' do
    it{ should belong_to(:user) }

    it{ should have_many(:likes).dependent(:destroy) }

    it{ should have_many(:prototype_images).dependent(:destroy) }
  end

  describe 'method_test' do
    let(:user){ create(:user) }
    let(:prototype){ create(:prototype, user: user) }
    describe 'like_user' do
      it 'return true when the user likes the prototype' do
        like = create(:like, user: user, prototype: prototype)
        expect(prototype.like_user(user)).to be_truthy
      end

      it 'return false when the user does not like the prototype' do
        another_user = create(:user)
        like = create(:like, user: another_user, prototype: prototype)
        expect(prototype.like_user(user)).to be_falsey
      end
    end
    describe 'main_image' do
      it 'return true when status is main' do
        prototype_image = create(:prototype_image, :main, prototype: prototype)
        expect(prototype.main_image).to be_truthy
      end
      it 'return false when status is sub' do
        prototype_image = create(:prototype_image, :sub, prototype: prototype)
        expect(prototype.main_image).to be_falsey
      end
    end
  end
end
