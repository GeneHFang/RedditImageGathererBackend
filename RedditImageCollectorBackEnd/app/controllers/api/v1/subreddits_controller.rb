class Api::V1::SubredditsController < ApplicationController
    before_action :set_subreddit, only: [:show, :update, :destroy]

    def index
        subreddits = Subreddit.all
        render json: Api::V1::SubredditSerializer.new(subreddits)
    end

    def create
        user = User.find(subreddit_params[:user_id])
        
        obj = { 
           name: subreddit_params[:name],
           url: subreddit_params[:url] 
        }

        
        subreddit = Subreddit.new(obj)

        if subreddit.valid?
            subreddit.save()
            UserSubreddit.create({user: user, subreddit: subreddit})
            render json: Api::V1::SubredditSerializer.new(subreddit)
        else
            render json: subreddit.errors, status: :unprocessable_entity
        end
    end

    def show
        render json: Api::V1::SubredditSerializer.new(@subreddit)
    end

    def update
        @subreddit.attributes = subreddit_params

        if @subreddit.save
            render json: Api::V1::SubredditSerializer.new(@subreddit)
        else 
            render json: @subreddit.errors, status: :unprocessable_entity
        end
    end

    def destroy
        subreddit = @subreddit.destroy

        render json: Api::V1::SubredditSerializer.new(subreddit)
    end

    private

    def set_subreddit
        @subreddit = Subreddit.find params[:id]
    end

    def subreddit_params
        params.require(:subreddit).permit(:name, :url, :user_id)
    end

end