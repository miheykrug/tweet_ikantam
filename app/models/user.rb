class User < ApplicationRecord

  has_many :tweets, dependent: :destroy

  def self.find_or_create_from_auth_hash(auth_hash)
    user = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
    user.update(
        name: auth_hash.info.name,
        nickname: auth_hash.info.nickname,
        token: auth_hash.credentials.token,
        secret: auth_hash.credentials.secret
    )
    user
  end

  def tweet(params)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
      config.access_token        = token
      config.access_token_secret = secret
    end

    if params[:image]
      client.update_with_media(params[:message], params[:image])
    else
      resp = client.update!(params[:message])
    end


  end

end
