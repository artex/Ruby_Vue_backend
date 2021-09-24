class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]
  before_action :authorized, except: [:confirm]
  # GET /posts
  def index
    @posts = Post.all

    render json: @posts
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  # def create
  #   @post = Post.new(post_params)

  #   if @post.save
  #     render json: @post, status: :created, location: @post
  #   else
  #     render json: @post.errors, status: :unprocessable_entity
  #   end
  # end
  def confirm
    # @post = Applicant.new(post_params)
    # render json: @post
    # if post_params[:profile_photo]
    #   if !File.extname(params[:post][:profile_photo]).eql?(".png")&&
    #     !File.extname(params[:post][:profile_photo]).eql?(".jpg")&&
    #     !File.extname(params[:post][:profile_photo]).eql?(".jpeg")
    #     @error = "Profile Photo should be image type"
    #   end
    # end
    # if !@post.valid? || @error
    #   render json: {errors: @post.errors, error: @error}
    # else
    #   render json: @Post
    # end
    
  end
  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:name, :profile_photo, :date, :phone_no1, :phone_no2, :email, :current_address, :hometown_address, :bachelor_university, :bachelor_year, :bachelor_degree, :master_university, :master_year, :master_degree, :diploma_name, :certificate, :programming, :english, :japanese, :other, :internship_info, :job_experience, :total_exp_year, :created_by, :updated_by)
    end
end
