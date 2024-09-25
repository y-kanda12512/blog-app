class ProfilesController < ApplicationController
    before_action :authenticate_user!

    def show
        @profile = current_user.profile
    end

    def edit
        # プロフィールがすでに登録されていれば既存のプロフィール情報をフォームに渡して表示する
        # # 存在していなければ新規に値をフォームに渡す
        @profile = current_user.prepare_profile
    end

    def update
        @profile = current_user.build_profile(profile_params)
        if @profile.save
          redirect_to profile_path, notice: 'プロフィール更新！'
        else
          flash.now[:error] = '更新できませんでした'
          render :edit
        end
    end

      private
      def profile_params
        params.require(:profile).permit(
          :nickname,
          :introduction,
          :gender,
          :birthday,
          :subscribed,
          :avatar
        )
      end
end