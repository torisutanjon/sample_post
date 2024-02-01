class PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post, only: [:show, :update,]

    def index
        @posts =  Post.all
    end

    def new
       @new_post = Post.new
    end

    def create
        @new_post = Post.new(post_params)
        @new_post.user_id = User.first.id

        if @new_post.save
            redirect_to posts_path
        else
            flash[:alert] = new_comment.error.full_message 
        end     
    end

    def show
        post_id = params[:post_id]
        @comment = Comment.new
    end
    
    def update
        if @post.update(post_params)
            redirect_to posts_path
        end
    end

    private

        def post_params
            params.require(:post).permit(:body) #,:author
        end

        def set_post 
            @post = Post.find params[:id]
        end
end
