class CommentsController < ApplicationController
  
  def create
    @micropost　=　Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.build(comment_params) 

    if @comment.save
      flash[:success] = "Posted successfully"
      redirect_back(fallback_location: comments_url(@micropost.id))
    else
      flash[:danger] = "Posting failed"
      redirect_back(fallback_location: comments_url(@micropost.id))
    end 
  end

  def destroy
    @comment = Comment.find(params[:id]) 
    if @comment.destroy
      render :index 
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content,:micropost_id)
  end

end
