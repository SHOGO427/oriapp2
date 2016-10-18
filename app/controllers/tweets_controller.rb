class TweetsController < ApplicationController

    before_action :move_to_index, except: :index

    def index
      # @tweets = Tweet.order("created_at DESC").page(params[:page]).per(5)
      tweet = Tweet.new
      tweets = []
      tweets << tweet
      @tweets = tweets
    end

    def new
    end

    def create
      Tweet.create(tweet_params)
      redirect_to action: 'index', flash: {success: 'Yes!! Success'}
    end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end

    def timeline
      @tweets = Tweet.order("created_at DESC")
    end

    private
    def tweet_params
      params.permit(:image, :place, :text)
    end

end