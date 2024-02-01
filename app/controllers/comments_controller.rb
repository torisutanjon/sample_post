class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_comment, only: [ :update,]

    def index
        @comments = Comment.all
    end

    def new
        @new_comment = Comment.new
    end

    def create
        @new_comment = Comment.new(comment_params)
        @new_comment.user_id = User.first.id

        if @new_comment.save
            redirect_to posts_path
        else
            flash[:alert] = new_comment.error.full_message 
        end  
    end

    def update
        if @comment.update(comment_params)
            redirect_to posts_path
        end
    end

    private

        def comment_params
            params.require(:comment).permit(:body)
        end
    
        def set_comment 
            @comment = Comment.find params[:id]
        end
end
