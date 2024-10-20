require 'rails_helper'

RSpec.describe Article, type: :model do
  let!(:user) { create(:user) }

  # 前提条件を記載しておく
  context 'タイトルと内容が入力されている場合' do
    let!(:article) { build(:article, user: user) }

    # before do
    #   user = User.create!({
    #     email: 'test@example.com',
    #     password: 'password'
    #   })
    #   @article = user.articles.build({
    #     title: Faker::Lorem.characters(number: 10),
    #     content: Faker::Lorem.characters(number: 300)
    #   })
    # end

    # 期待結果を確認する
    it 'タイトルと内容が入力されていれば、記事を保存できる' do
      # 保存できるか確認
      expect(article).to be_valid
    end
  end

  # 失敗する場合
  # エラーメッセージを得て、比較してエラーかどうかを確かめるため
  context 'タイトルの文字が一文字の場合' do
    # createにすると1文字では例外が発生して実行できないのでsaveを使用して保存できるか確かめる
    let!(:article) { build(:article, title: Faker::Lorem.characters(number: 1), user: user) }

    before do
      article.save
    end

    it '記事を保存できない' do
      expect(article.errors.messages[:title][0]).to eq('は2文字以上で入力してください')
    end
  end
end
