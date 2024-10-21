require 'rails_helper'

RSpec.describe "Articles", type: :request do
  let!(:user) { create(:user) }
  let!(:articles) { create_list(:article, 3, user: user) }

  # 記事が取得できるか確認
  describe "GET /articles" do
    it "200ステータスが帰ってくる" do
      get articles_path
      expect(response).to have_http_status(200)
    end
  end

  # 記事を登録できるか
  describe "POST /articles" do
    context 'ログインしている場合' do
      before do
        sign_in user
      end

      it "記事が保存されていることを確認する" do
        # コントローラーに記載しているストロングパラメータをattributes_forで作成する
        article_params = attributes_for(:article)
        post articles_path({article: article_params})
        expect(response).to have_http_status(302)
        expect(Article.last.title).to eq(article_params[:title])
        # action_textを使用している場合は「body.to_plain_text」でテキストの内容を取得する
        expect(Article.last.content.body.to_plain_text).to eq(article_params[:content])
      end
    end

    context 'ログインしていない場合' do
        it 'ログイン画面に遷移する' do
        article_params = attributes_for(:article)
        post articles_path({article: article_params})

        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
