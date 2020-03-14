class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  # @post = Post.new(params["post"])
		# @post = Post.new(params.require(:post).permit(:title, :description))
		@post = Post.new(post_params(:title, :description))
  	@post.save
  	redirect_to post_path(@post)
	end

	def update
		@post = Post.find(params[:id])
		# @post.update(params["post"])
		# @post.update(params.require(:post).permit(:title))
		@post.update(post_params(:title))
	  redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end

# DRY
	private
 
	# whitelisting attributes
	def post_params(*args)
	  params.require(:post).permit(*args)
	end
end

# Strong Params

# Permit vs. Require
# Require means that the params that get passed in must contain a key called "post". If it's not included then it fails and the user gets an error
# The permit method is a bit looser. It means that the params hash may have whatever keys are in it. So in the create case, it may have the :title and :description keys. If it doesn't have one of those keys it's no problem: the hash just won't accept any other keys.
