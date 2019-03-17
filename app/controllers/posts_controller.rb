class PostsController < ApplicationController
  before_action :require_user, only: [:index, :show, :new, :edit, :create, :update, :destroy, :delete_image_attachment]
  before_action :set_post, only: [:visit_post, :show, :edit, :update, :destroy]

  # GET /home
  def home
    @home = true
    @posts = Post.all.order(created_at: :desc)
    @carousel = Post.last(3)
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  # GET /search
  def search
    index
    render :index
  end

  def visit_post
  end

  # GET /posts
  # GET /posts.json
  def index
    @index = true
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_image_attachment
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge
    flash[:notice] = 'Image was successfully removed.'
    redirect_back(fallback_location: posts_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description, :title_image, post_images: [], category_ids: [])
    end
end
