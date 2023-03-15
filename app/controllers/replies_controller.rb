class RepliesController < ApplicationController
  def new
    @comment = Comment.new
    @parent = Comment.find(params[:comment_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.parent = Comment.find(params[:comment_id])

    respond_to do |format|
      if @comment.save
        format.turbo_stream
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end

