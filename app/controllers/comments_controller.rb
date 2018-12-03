class CommentsController < ApplicationController

  def index
    @comments = @post.comments.include(:user)
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
       @post = @comment.post
       respond_to do |format|    #collect data and save as string
       #format.json {render json: @posts}
       format.html
       format.js
      end
      #redirect_to post_path(@post)
    else
        flash[:alert] = "Something went wrong."
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
      @post = @comment.post
      if @comment.destroy
        respond_to do |format|    #collect data and save as string
        format.html
        format.js
        end
      else
        flash[:alert] = "Something went wrong."
      end
  end

  private
    def comment_params
      params.required(:comment).permit :user_id, :post_id, :content
    end
end
