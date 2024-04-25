class PostsController < ApplicationController
  def new
    @country = Country.find(params[:country_id])
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @country = Country.find(params[:country_id])

    # Below is the same as @post.country_id = @country.id
    @post.country = @country
    if @post.save
      redirect_to country_path(@country)
    else
      render :new, status: :unprocessable_entity
      # This makes it so that 422 HTTP Status occurs if there is an issue with the post
    end
  end

  def show
    @post = Post.find(params[:id])
    @country = @post.country
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to country_path(@post.country), status: :see_other
  end

  private

  def set_country
    @country = Country.find(params[:country_id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
end
