require 'rails_helper'

describe User do
  describe '#create' do
    let(:message) { build(:message) }
    context "is valid?" do
      it "is valid with text?" do
        expect(message).to be_valid
      end

      it "is valid with image?" do
        expect(message).to be_valid
      end

      it "is valid with text and image?" do
        expect(message).to be_valid
      end
    end

    context "is invalid?" do
      it "is invalid without group_id?" do
        message[:group_id] = nil
        message.valid?
        expect(message.errors[:group_id]).to include('を入力してください')
      end

      it "is invalid without user_id?" do
        message[:user_id] = nil
        message.valid?
        expect(message.errors[:user_id]).to include('を入力してください')
      end

      it "is invalid without text and image?" do
        @message = build(:message, text: nil, image: nil)
        @message.valid?
        expect(@message.errors[:text]).to include('を入力してください')
      end
    end
  end
end
