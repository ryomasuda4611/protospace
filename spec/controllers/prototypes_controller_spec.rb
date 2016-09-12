require 'rails_helper'
describe PrototypesController do
  let(:prototype){ create(:prototype) }
  context 'user is logined' do
    login_user
    describe 'GET #index' do

      it 'assigns the requested contact to @prototype' do
        prototypes = create_list(:prototype, 3)
        get :index
        expect(assigns(:prototypes).to_a).to eq (prototypes.sort{ |a,b| b.created_at <=> a.created_at })
      end

      it 'renders the :index template' do
        get :index
        expect(response).to render_template :index
      end
    end

    describe 'GET #show' do
      before do
        get :show, id: prototype
      end

      it 'assigns the requested contact to @prototype' do
        expect(assigns(:prototype)).to eq prototype
      end

      it 'assigns the requested contact to @comment' do
        expect(assigns(:comment)).to be_a_new(Comment)
      end

      it 'renders the :show template' do
        expect(response).to render_template :show
      end
    end

    describe 'GET #edit' do
      before do
        get :edit, id: prototype
      end

      it 'assigns the requested contact to @prototype' do
        expect(assigns(:prototype)).to eq prototype
      end

      it 'renders the :edit template' do
        expect(response).to render_template :edit
      end
    end

    describe 'GET #new' do
      before do
        get :new
      end
      it 'assigns the requested contact to @prototype' do
        expect(assigns(:prototype)).to be_a_new(Prototype)
      end

      it 'assigns the requested contact to @main_image' do
        expect(assigns(:main_image)).to be_a_new(PrototypeImage)
      end

      it 'assigns the requested contact to @sub_image' do
        expect(assigns(:sub_images)).to include (be_a_new(PrototypeImage))
      end
    end

    describe 'PATCH #update' do
      before do
        patch :update, id: prototype, prototype: attributes_for(:prototype, title: 'test')
      end
      context 'with valid parameter' do
        it 'assigns the requested contact to @prototype' do
          expect(assigns(:prototype)).to eq prototype
        end

        it 'is updated' do
          prototype.reload
          expect(prototype.title).to eq ('test')
        end

        it 'redirect_to root_path' do
          expect(response).to redirect_to root_path
        end
      end
      context 'with invalid parameter' do
        before do
          patch :update, id: prototype, prototype: attributes_for(:prototype, title: 'invalid', concept: '')
        end

        it 'is not updated' do
          prototype.reload
          expect(prototype.title).not_to eq 'invalid'
        end

        it 'redirect_to render :edit ' do
          expect(response).to redirect_to edit_prototype_path
        end
      end
    end
    describe 'GET #create' do
      context 'parameter is valid' do
        it 'is created' do
          expect{ post :create, id: prototype, prototype: attributes_for(:prototype) }.to change{ Prototype.count }
        end

        it 'redirect_to root_path' do
          post :create, id: prototype, prototype: attributes_for(:prototype)
          expect(response).to redirect_to root_path
        end
      end

      context 'parameter is invalid' do
        it 'is not created' do
          prototype = create(:prototype)
          expect{ post :create, id: prototype, prototype:attributes_for(:prototype, title: nil) }.not_to change{ Prototype.count }
        end
        it 'redirect_to new_prototype_path' do
          post :create, id: prototype, prototype: attributes_for(:prototype, title: nil)
          expect(response).to redirect_to new_prototype_path
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'assigns the requested contact to @prototype' do
        delete :destroy, id: prototype
        expect(assigns(:prototype)).to eq prototype
      end

      it 'is deleted' do
        prototype
        # オブジェクト作成
        expect{ delete :destroy, id: prototype }.to change{ Prototype.count }
      end

      it 'redirect_to root_path' do
        delete :destroy, id: prototype
        expect(response).to redirect_to root_path
      end
    end
  end
  context 'user is not logined' do
    describe 'GET #show' do
      it 'redirect_to new_user_session_path' do
        get :show, id: prototype
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'GET #edit' do
      it 'redirect_to new_user_session_path' do
        get :edit, id: prototype
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'GET #new' do
      it 'redirect_to new_user_session_path' do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'PATCH #update' do
      it 'redirect_to new_user_session_path' do
        patch :update, id: prototype, prototype: attributes_for(:prototype)
        expect(response).to redirect_to new_user_session_path
      end
    end
    describe 'DELETE #destroy' do
      it 'redirect_to new_user_session_path' do
        delete :destroy, id: prototype
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end