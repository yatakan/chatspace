require 'rails_helper'

describe User do
  describe '#create' do
    let(:message) { build(:message) }
    let(:image_path) { File.join(Rails.root, 'spec/images/test.jpg') }
    let(:image) { Rack::Test::UploadedFile.new(image_path) }

    it "is valid with text?" do
      message[:text] = "こんにちは"
      expect(message).to be_valid
    end

    it "is valid with image?" do
      message[:image] = image
      expect(message).to be_valid
    end

    it "is valid with text and image?" do
      message[:text] = "こんにちは"
      message[:image] = image
      expect(message).to be_valid
    end

    it "is invalid without group_id?" do
      message[:group_id] = nil
      message.valid?
      expect(message.errors[:group_id]).to include('を入力してください')
    end

    it "is invalid without group_id?" do
      message[:user_id] = nil
      message.valid?
      expect(message.errors[:user_id]).to include('を入力してください')
    end

  end

  describe '#create in_another_scope' do
    it "is invalid without text and image?" do
      @message = Message.new(text: nil, image: nil, user_id:1, group_id:1)
      @message.valid?
      expect(@message.errors[:text]).to include('を入力してください')
    end
  end
end
