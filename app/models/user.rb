class User < ActiveRecord::Base
  devise :database_authenticatable
  devise :omniauthable, :omniauth_providers => [:github]

  has_many :rates

  def self.from_omniauth!(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.email = auth.info.email
      user.nickname = auth.info.nickname
      user.encrypted_password = Devise.friendly_token[0,20]
    end
  end

  def user_allowed?
    require 'yaml'

    data = YAML.load_file "config/allowed_users.yml"
    allowed_users = data["allowed_users"]
    allowed_users.include?(self.email)
  end

end
