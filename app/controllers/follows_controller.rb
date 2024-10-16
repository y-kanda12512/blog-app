class FollowsController < ApplicationController
    # フォローしていない場合でフォローボタンを押すとログイン画面へ遷移するように
    before_action :authenticate_user!

    def create
        current_user.follow!(params[:account_id])
        redirect_to account_path(params[:account_id])
    end
end