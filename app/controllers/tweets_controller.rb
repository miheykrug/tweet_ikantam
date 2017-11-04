class TweetsController < ApplicationController
  rescue_from Twitter::Error::DuplicateStatus, with: :tweet_exist

  def new
  end

  def create
    @tweet = current_user.tweets.build(twitter_params)
    if @tweet.valid?
      current_user.tweet(twitter_params[:message])
      @tweet.save
      flash[:success] = "Tweet created!"
      redirect_to '/tweets/new'
    else
      flash[:error] = "Tweet is blank!"
      render 'new'
    end

  end

  def tweet_exist
    flash[:error] = "You already sent this tweet."
    redirect_back(fallback_location: new_tweet_path)
  end

  private

    def twitter_params
      params.require(:tweet).permit(:message)
    end
end
