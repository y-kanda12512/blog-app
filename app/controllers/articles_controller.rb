class ArticlesController < ApplicationController
    # 全ての記事を表示する（railsの決まり）
    def index
        @articles = Article.all
    end

    def show
       @article = Article.find(params[:id])
    end
end