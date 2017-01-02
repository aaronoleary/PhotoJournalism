class PostsController < ApplicationController
  def index
    @post = Posts.all
  end
  def new
    @post = Post.new
  end
  def create
    @post = current_user.posts.build(post_params)
    if @post.sace
      flash[:success] = 'Image Posted!'
      redirect_to posts_path
    else
      render 'new'
    end
  end
  private
  def posts_params
    params.require(:post).permit(:title, :image, :description)
  end

end
