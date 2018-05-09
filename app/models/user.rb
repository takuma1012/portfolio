class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

protected
  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)

    unless user
      user = User.create(nick_name: auth.info.name,
                         provider:  auth.provider,
                         uid:       auth.uid,
                         password:  Devise.friendly_token[0, 20],
                         email:     auth.info.email)
    end
    user
  end

 def self.find_for_oauth(auth)
  ### providerとuidでUserレコードを取得する ###
  ### 存在しない場合は、ブロック内のコードを実行して作成する ###
 	user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(uid:      	auth.uid,
				                 email:    	User.dummy_email(auth),
                         provider:  auth.provider,
				                 password: 	Devise.friendly_token[0, 20],
				                 nick_name: auth.info.nickname)
    end
    user
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  # ### providerがある場合（Twitter経由で認証）は ###、
  # ### passwordは要求しないようにする。 ###
  # def password_required?
  #   super && provider.blank?
  # end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
