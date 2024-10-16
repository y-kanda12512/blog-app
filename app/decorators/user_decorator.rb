module UserDecorator
  def display_name
    # if profile && profile.nickname
    #   profile.nickname
    # else
    #  self.email.split('@').first
    # end

    # 「〇〇&」←丸部分がNullでなければ呼び出す
    profile&.nickname || self.email.split('@').first
  end

  def avatar_image
    if profile&.avatar&.attached?
      profile.avatar
    else
      'default-avatar.png'
    end
  end
end
