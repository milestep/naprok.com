class PostsController < ApplicationController
def index
  @posts = Post.all
  if params[:search]
    @posts = Post.search(params[:search]).order("created_at DESC").page(params[:page]).per(6)
  else
    @posts = Post.all.order('created_at DESC').page(params[:page]).per(6)
  end
end

	def show
		@post = Post.friendly.find(params[:id])
		@posts = Post.order("created_at desc").limit(4).offset(1)
	end

	private
		def post_params
			params.require(:post).permit(:title, :body)
		end
end
