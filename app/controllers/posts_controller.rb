class PostsController < ApplicationController
  def new
    @country = Country.find(params[:country_id])
    @post = Post.new
  end

  def create
    @post = Post.new(review_params)
    @post.restaurant = @post
    if @post.save
      redirect_to country_path(@country)
    else
      render :new, status: :unprocessable_entity
      # This makes it so that 422 HTTP Status occurs if there is an issue with the post
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to country_path(@post.country), status: :see_other
  end

  private

  def set_country
    @country = Country.find(params[:restaurant_id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
