class WallsController < ApplicationController
  def show
  	# render :text => params.inspect
  	@user = User.find(params[:id])
  	@post = Post.new
  	@posts = Post.all
  	@comment = Comment.new
  	@comments = Comment.all
  end

  def post
  	# render :text => params.inspect
  	user = User.find(session[:user_id])
  	@post = User.find(session[:user_id]).posts.new(new_post_params)
  	if @post.save
  		redirect_to wall_path(user)
  	else
  		redirect_to wall_path(user)
  	end
  end

  def comment
  	# render :text => params.inspect
  	user = User.find(session[:user_id])
  	@comment = User.find(session[:user_id]).comments.new(new_comment_params)
  	if @comment.save
  		redirect_to wall_path(user)
  	else
    	redirect_to wall_path(user)
  	end
  end

	private
		def new_post_params
			params.require(:post).permit(:comment, :user_id)
		end

		def new_comment_params
			params.require(:comment).permit(:comment, :post_id)
		end
end
