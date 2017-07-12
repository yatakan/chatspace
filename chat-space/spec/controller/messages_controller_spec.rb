require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let(:message) { build(:message) }

  describe 'GET #index' do
    context 'when user login' do

      before do
        login_user user
      end

      it "is assigns sg @message" do
        blank_message = Message.new
        get :index, params: { group_id: group }
        expect(assigns(:message).attributes).to eq(blank_message.attributes)
      end

      it "is assigns sg @group" do
        get :index, params: { group_id: group }
        expect(assigns(:group)).to eq(group)
      end

      it "is assigns pl @messages has current_group.users" do
        messages = create_list(:message, 3, user_id: user.id, group_id: group.id)
        get :index, params: { group_id: group }
        expect(assigns(:messages)).to match(messages)
      end

      it "is assings pl @groups has current_user.groups" do
        groups = create_list(:group, 3)
        groups.each do |g|
          g.groups_user.create(user: user)
        end
        get :index, params: { group_id: groups.first.id }
        groups = user.groups
        expect(assigns(:groups)).to eq groups
      end

      it "renders index template?" do
        get :index, params: { group_id: group }
        expect(response).to render_template :index
      end
    end

    context 'when user is not login' do
      it "can redirect to new_user_session?" do
        get :index, params: { group_id: group }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'post #create' do
    context 'when user login and successed processing' do
      before do
        login_user user
      end

      it 'is write in Database?' do
        expect do
          post :create, params: { group_id: group, message: attributes_for(:message) }
        end.to change(Message, :count).by(1)
      end

      it 'is redirect to index template?' do
        post :create, params: { group_id: group, message: attributes_for(:message) }
        expect(response).to redirect_to group_messages_path
      end
    end

    context 'when user login and unsuccessed processing' do
      before do
        login_user user
      end

      it 'is not write in Database?' do
        expect do
          post :create, params: { group_id: group, message: attributes_for(:message, text: nil, image: nil) }
        end.to change(Message, :count).by(0)
      end

      it "is redirect to index template?" do
        message = build(:message, text:"")
        post :create, params: { group_id: group, message: attributes_for(:message) }
        expect(response).to redirect_to group_messages_path
      end
    end

    context 'when user is not login' do
      it "can redirect to new_user_session?" do
        post :create, params: { group_id: group, message: attributes_for(:message) }
        expect(response).to redirect_to new_user_session_path
      end

      it 'can not write in Database?' do
        expect do
          post :create, params: { group_id: group, message: attributes_for(:message) }
        end.to change(Message, :count).by(0)
      end
    end
  end
end
