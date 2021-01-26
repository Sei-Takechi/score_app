require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  context "アクセス制限のあるアクション" do
    before do
      user = create(:user)
      log_in user
    end

    describe "#new" do
      it "正しいhttpレスポンスを返すこと" do
        get :new
        expect(response).to have_http_status(:success)
      end

      it "正しいviewを描くこと" do
        get :new
        expect(response).to render_template :new
      end

    end

    describe "#create" do

      before do
        @params = { content: "Mytext", title: "sample",
                    file: Rack::Test::UploadedFile.new(
                    Rails.root.join('spec', 'fixtures', 'sample.pdf'))
                   }
        @user = FactoryBot.create(:user)
        @post = @user.posts.build(@params)
        # @post = @user.posts.build(id: 1, content: @params[:content], title: @params[:title],
        #                           file: @params[:file], user_id: 1)
      end

      context "#createの呼び出し" do
        it "正しいhttpレスポンスを返すこと" do
          post :new, params: @params
          expect(response).to have_http_status(:success)
        end
      end

      context "投稿の保存" do
        
        it "正しい投稿を保存できること" do
          post :new, params: @params
          expect{ @post.save! }.to change{ Post.count }.by(1)
        end

        it "user_idが空の投稿を保存できないこと" 

        it "contentが空の投稿を保存できないこと"

        it "contentが200文字以上の投稿を保存できないこと"

        it "fileが空の投稿を保存できないこと"

        it "titleが空の投稿を保存できないこと"

        it "titleが30文字以上の投稿を保存できないこと"

        it "pdfサイズが5MB以上の投稿が保存できないこと"

      end
    end
  end



  

  

  context "アクセス制限のないアクション" do
    describe "#indexの呼び出し" do
      it "正しいhttpレスポンスを返すこと" do
        get :index
        expect(response).to have_http_status(:success)
      end

      it "正しいviewを描くこと" do
        get :index
        expect(response).to render_template :index
      end

    end
  end

end
