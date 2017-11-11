class TweetsController < ApplicationController
  rescue_from Twitter::Error::DuplicateStatus, with: :tweet_exist
  before_action :signed_in_user

  def index
    @tweets = current_user.tweets.order("created_at desc")
  end

  def create
    @tweet = current_user.tweets.build(twitter_params)
    if @tweet.valid?
      tweet = current_user.tweet(twitter_params)
      @tweet.url = tweet.uri
      @tweet.save
      flash[:success] = "Tweet created!"
      redirect_to tweets_path
    else
      @tweets = current_user.tweets.order("created_at desc")
      flash.now[:danger] = "Tweet is blank! Add text or image."
      render 'index'
    end

  end

  def tweet_exist
    flash[:danger] = "You already sent this tweet."
    redirect_back(fallback_location: tweets_path)
  end

  private

    def twitter_params
      params.require(:tweet).permit(:message, :image, :url)
    end
end
