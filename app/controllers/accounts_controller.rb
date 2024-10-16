class AccountsController < ApplicationController
    def show
        @user = User.find(params[:id])

        # 現状ログインしているユーザー記事からのプロフィールを見ようとしたときは、右上のアイコンで見るのと同じなので自分のプロフィールを見るように変更
        if @user == current_user
            redirect_to profile_path
        end
    end
end