class User < ApplicationRecord
  def self.find_or_create_from_auth_hash(auth_hash)
    user = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
    user.update(
        name: auth_hash.info.name,
        token: auth_hash.credentials.token,
        secret: auth_hash.credentials.secret
    )
    user
  end

  def tweet(tweet)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
      config.access_token        = token
      config.access_token_secret = secret
    end

    client.update(tweet)
  end
end
