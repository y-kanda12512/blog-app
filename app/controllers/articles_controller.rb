class ArticlesController < ApplicationController

    before_action :set_article,only:[:show,:edit,:update]

    # 全ての記事を表示する（railsの決まり）
    def index
        @articles = Article.all
    end

    # 個別の記事
    def show
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
    end

    def update
        if @article.update(article_params)
            redirect_to article_path(@article),notice: '更新できました'
        else
            flash.now[:error] = '更新できませんでした'
            render :edit
        end
    end

    def destroy
        article = Article.find(params[:id])
        article.destroy!
        redirect_to root_path,notice:'削除に成功しました'
    end

    private
    def article_params
        puts '-----------'
        puts params
        puts '-----------'
        params.require(:article).permit(:title,:content)
    end

    # メソッドが実行される前に実行するメソッド
    def set_article
        @article = Article.find(params[:id])
    end
end
