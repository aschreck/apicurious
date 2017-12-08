class User < ApplicationRecord

  def self.find_or_create_by_auth(auth)
    user = User.find_or_create_by(uid: auth['uid'])

    user.nickname = auth['info']['nickname']
    user.name = auth['info']['name']
    user.token = auth['credentials']['token']
    user.image_url = auth['extra']['raw_info']['avatar_url']

    user.save
    user
  end 

  def self.verify_current_token (user, auth)
    unless user.token == auth[:credentials][:token]
      user.update(token: auth[:credentials][:token])
    end 
  end 
end
