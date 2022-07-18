class CommentsController < ApplicationController
before_action :require_user
  def create
    # debugger
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.build(comment_params)
    @comment.chef = current_user
    if @comment.save
      flash[:success] = 'Comment is posted'
      redirect_to @recipe
    else
      flash[:danger] = 'Comment is not posted'
      redirect_to @recipe
    end
  end


  private
    def comment_params
      params.require(:comment).permit(:description)
    end
end
