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
      @tweet = Tweet.new
    end

    def create
      tweet = Tweet.new(image: tweet_params[:image], place: tweet_params[:place], text: tweet_params[:text], user_id: current_user.id)

      tweet.save(image: tweet_params[:image], place: tweet_params[:place], text: tweet_params[:text], user_id: current_user.id)
      redirect_to action: 'index', flash: {success: 'Yes!! Success'}
    end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end

    def timeline
      # @tweets = Tweet.order("created_at DESC")
      @tweets = Tweet.all
    end

    def destroy
      tweet = Tweet.find(params[:id])
      if tweet.user_id == current_user.id
        tweet.destroy
      redirect_to action: :index
      end
    end

    def edit
      @tweet = Tweet.find(params[:id])
    end

    def update
      tweet = Tweet.find(params[:id])
      if tweet.user_id == current_user.id
        tweet.update(tweet_params)
      redirect_to action: :index
      end
    end


    def search_rakuten_api(keyword)
      items = RakutenWebService::Ichiba::Item.search(keyword: keyword)
      images_arr = []
      items.each do |item|

      puts item['itemName']
      puts item['itemPrice']
      puts item['itemUrl']
      end
    end

    private
    def tweet_params
      params.require(:tweet).permit(:image, :place, :text)
    end

end