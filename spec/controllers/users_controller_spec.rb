require 'rails_helper'
describe UsersController do
  let(:user){ create(:user) }
  context 'user logined' do
    login_user

    describe 'GET #edit' do
      it 'renders the :edit template' do
        get :edit, id: user
        expect(response).to render_template :edit
      end

    end

    describe 'GET #show' do

      it 'assigns the requested contact to @user' do
        get :show, id: user
        expect(assigns(:user)).to eq user
      end

      it 'populates an array of prototypes ' do
        prototypes = create_list(:prototype, 5, user_id: user.id)
        get :show, id: user
        expect(assigns(:prototypes).to_a).to eq(prototypes)
      end
      it 'renders the :edit template' do
        get :show, id: user
        expect(response).to render_template :show
      end

    end
    describe 'PATCH #update' do
      context 'when parameter is valid' do
        before do
          patch :update, id: user, user: attributes_for(:user, username: 'test')
        end
        it 'is updated' do
          user.reload
          expect(user.username).to eq ('test')
        end

        it 'redirect to the user_path' do
          expect(response).to redirect_to root_path
        end
      end
      context 'when parameter is invalid' do
        before do
          patch :update, id: user, user: attributes_for(:user, username: 'invalid', password: nil)
        end

        it 'isn\'t updated' do
          user.reload
          expect(user.username).not_to eq 'invalid'
        end

        it 'redirect to the edit_user_path ' do
          expect(response).to redirect_to edit_user_path
        end
      end
    end
  end
  context 'user not logined' do
  let(:user){create(:user)}
    describe 'GET #show' do
      it 'redirect_to new_user_session_path' do
        get :show, id: user
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'GET #edit' do
      it 'redirect_to new_user_session_path' do
        get :edit, id: user
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'PATCH #update' do
      it 'redirect_to new_user_session_path' do
        patch :update, id: user, user: attributes_for(:user)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
