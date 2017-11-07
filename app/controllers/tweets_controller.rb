class TweetsController < ApplicationController
  rescue_from Twitter::Error::DuplicateStatus, with: :tweet_exist

  def new
    @tweets = current_user.tweets
  end

  def create
    @tweet = current_user.tweets.build(twitter_params)
    if @tweet.valid?
      current_user.tweet(twitter_params)
      @tweet.save
      flash[:success] = "Tweet created!"
      redirect_to '/tweets/new'
    else
      flash[:danger] = "Tweet is blank! Add text or image."
      render 'new'
    end

  end

  def tweet_exist
    flash[:error] = "You already sent this tweet."
    redirect_back(fallback_location: new_tweet_path)
  end

  private

    def twitter_params
      params.require(:tweet).permit(:message, :image)
    end
end
