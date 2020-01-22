class Api::V1::ImagesController < ApplicationController
    before_action :set_image, only: [:show, :update, :destroy]

    def index
        images = Image.all
        render json: Api::V1::ImageSerializer.new(images)
    end

    def create
        user = User.find(image_params[:user_id])
    
        obj = {
            url: image_params[:url],
            file_type: image_params[:file_type],
            subreddit_name: image_params[:subreddit_name],
            nsfw: image_params[:nsfw],
            upvotes: image_params[:upvotes],
            web_url: image_params[:web_url]
        }
        subredditurl = "https://reddit.com/r/#{obj[:subreddit_name]}"
        image = Image.new(obj)
        subreddit = Subreddit.new({name: obj[:name],
                                  url: subredditurl
                                })
        
        if image.valid?
            image.save()
            if subreddit.valid?
                subreddit.save()
            end
            UserImage.create({user: user, image: image})
            UserSubreddit.create({user: user, subreddit: subreddit})
            render json: Api::V1::ImageSerializer.new(image)
        else
            render json: image.errors, status: :unprocessable_entity
        end
    end

    def show
        render json: Api::V1::ImageSerializer.new(@image)
    end

    def update
        @image.attributes = image_params

        if @image.save
            render json: Api::V1::ImageSerializer.new(@image)
        else 
            render json: @image.errors, status: :unprocessable_entity
        end
    end

    def destroy
        image = @image.destroy

        render json: Api::V1::ImageSerializer.new(image)
    end

    private

    def set_image
        @image = Image.find params[:id]
    end

    def image_params
        params.require(:image).permit(:url, :file_type, :upvotes, :nsfw, :user_id, :subreddit_name, :web_url)
    end

end