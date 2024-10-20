class Apps::TimelinesController < Apps::ApplicationController
    def show
        # ユーザーのIDを配列で取得できる
       user_ids = current_user.followings.pluck(:id)

       # 配列を渡すとor検索になる
       @articles = Article.where(user_id: user_ids)
    end
end