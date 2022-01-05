class ProfilesController < ApplicationController
  def index
    @profiles =  Profile.all
    redirect_to root_path if !current_user
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)

    if @profile.save
        UsermailerMailer.acknowledge_mail(@profile).deliver_later
     redirect_to @profile
    else
     render :new
    end
  end


  def edit
   @profile = Profile.find(params[:id])
  end

  def update
   @profile = Profile.find(params[:id])

   if @profile.update(profile_params)
      redirect_to @profile
   else
      render :edit
    end
  end

  def destroy
   @profile = Profile.find(params[:id])
   @profile.destroy
     redirect_to root_path
  end

  private
  def profile_params

   params.require(:profile).permit(:full_name, :user_id, :gender, :email,
      :date_of_birth, :registration_no, :course, :mobile_no)
  end

end
