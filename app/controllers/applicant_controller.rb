class ApplicantController < ApplicationController
    before_action :authorized, except: [:create, :confirm, :fileread]

    def index
        @posts = Applicant.all
    
        render json: @posts
    end
    def confirm
        @post = Applicant.new(post_params)
        if !@post.valid?
            render json: @post.errors, status: 300
        else
            render json: @post
        end
    end
    def create
        if params[:filename]
            name = params[:filename].original_filename
            path = File.join("app", "assets" , "images", name)
            File.open(path, "wb") { |f| f.write(params[:filename].read) }
            render json: params

        else
            render json: {"error":"error"}
        end
        @applicant = Applicant.new(post_params)
        @applicant.save
    end
    def details
        @applicant = Applicant.find(params[:id])
        photoname = @applicant.profile_photo

        path = "app/assets/images/"+photoname
        data = File.open(path, 'rb') {|file| file.read }
        photofile = "data:image;base64,#{Base64.encode64(data)}"
        @applicant.profile_photo = photofile

        @dob = @applicant[:date].strftime("%B %d, %Y")
        render json: {"applicant":@applicant,"dob":@dob}
    end
    def destroy
        @applicant = Applicant.find(params[:id])
        @applicant.destroy
    end


    private
    def post_params
        params.permit(:name, :profile_photo, :date, :phone_no1, :phone_no2, :email, :current_address, :hometown_address, :bachelor_university, :bachelor_year, :bachelor_degree, :master_university, :master_year, :master_degree, :diploma_name, :certificate, :programming, :english, :japanese, :other, :internship_info, :job_experience, :total_exp_year, :created_by, :updated_by)
    end
end
