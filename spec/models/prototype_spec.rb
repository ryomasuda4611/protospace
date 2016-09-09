require 'rails_helper'

describe Prototype do
  describe 'validation' do
    let(:prototype){ build(:prototype) }
    it 'is valid' do
      expect(prototype).to be_valid
    end

    %w{ title concept catch_copy }.each do |column_name|
      it "is invalid without #{column_name}"  do
        prototype[column_name] = ""
        expect(prototype).not_to be_valid
      end
    end
  end

  describe 'association' do
    let(:user){ create(:user) }
    let(:prototype){ create(:prototype)}
    context 'with user' do
      it 'associate with user' do
        prototype = build(:prototype, user: user)
        expect(prototype.user).to eq user
      end
    end

    context 'with comment' do
      it 'is deleted with comments' do
        comment = create(:comment, prototype: prototype)
        expect{ prototype.destroy }.to change{ Comment.count }
      end
    end

    context 'with prototype_image' do
      it 'is deleted with prototype_images' do
        prototype_image = create(:prototype_image, :main, prototype: prototype)
        expect{ prototype.destroy }.to change{PrototypeImage.count}
      end
    end

    context 'with like' do
      it 'is deleted with likes' do
        like = create(:like, prototype: prototype)
        expect{ prototype.destroy }.to change{ Like.count }
      end
    end
  end

  describe 'method_test' do
    let(:user){ create(:user) }
    let(:prototype){ create(:prototype, user: user) }
    describe 'like_user' do
      context 'when the user likes the prototype' do
        it 'return true ' do
          like = create(:like, user: user, prototype: prototype)
          expect(prototype.like_user(user)).to be_truthy
        end
      end

      context 'when the user does not like the prototype' do
        it 'return false' do
          another_user = create(:user)
          like = create(:like, user: another_user, prototype: prototype)
          expect(prototype.like_user(user)).to be_falsey
        end
      end
    end

    describe 'main_image' do
      context 'when status of image is main' do
        it 'return true' do
          prototype_image = create(:prototype_image, :main, prototype: prototype)
          expect(prototype.main_image).to be_truthy
        end
      end

      context 'when status of image is sub' do
        it 'return false' do
          prototype_image = create(:prototype_image, :sub, prototype: prototype)
          expect(prototype.main_image).to be_falsey
        end
      end
    end
  end
end
