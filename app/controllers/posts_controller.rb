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
	#   @post = Post.new(params["post"])
	#   @post.save
	#   redirect_to post_path(@post)
		# @post = Post.new(params.require(:post).permit(:title, :description))
		@post = Post.new(post_params)
  		@post.save
  		redirect_to post_path(@post)
	end

	def update
	#   @post = Post.find(params[:id])
	#   @post.update(params["post"])
	#   redirect_to post_path(@post)
		@post = Post.find(params[:id])
		# @post.update(params.require(:post).permit(:title))
		@post.update(post_params)
		redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end

	private
 
	def post_params
		params.require(:post).permit(:title, :description)
	end

	# def post_params(*args)
	# 	params.require(:post).permit(*args)
	#   end
end
