class ArticlesController < ApplicationController
    # 全ての記事を表示する（railsの決まり）
    def index
        @articles = Article.all
    end

    # 個別の記事
    def show
       @article = Article.find(params[:id])
    end

    # 記事を作成
    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)

        if @article.save
            redirect_to article_path(@article),notice: '保存できました'
        else
            flash.now[:error] = '保存できませんでした'
            render :new
        end
    end

    def edit
       @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            redirect_to article_path(@article),notice: '更新できました'
        else
            flash.now[:error] = '更新できませんでした'
            render :edit
        end
    end

    private
    def article_params
        puts '-----------'
        puts params
        puts '-----------'
        params.require(:article).permit(:title,:content)
    end
end