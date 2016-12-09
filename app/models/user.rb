class User < ApplicationRecord

  def self.from_omniauth(auth_info)
  # where(uid: auth_info[:uid]).find_or_create_by do |new_user|
    new_user = User.find_or_create_by(uid: auth_info[:uid])
    new_user.uid                = auth_info.uid
    new_user.username           = auth_info.extra.raw_info.login
    new_user.token              = auth_info.credentials.token
    new_user.avatar_url         = auth_info.extra.raw_info.avatar_url
    new_user.followers          = auth_info.extra.raw_info.followers
    new_user.following          = auth_info.extra.raw_info.following
    new_user.save
    new_user
    end
  end
