class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end
  def create
    @profile = Profile.create(profile_prams)
    if @profile.save
      redirect_to root_path
    else
      render :new
    end
  end
  private
    def profile_prams
      params.require(:profile).permit(:first_name, :family_name, :first_name_kana, :family_name_kana, :birth_date).merge(user_id: current_user.id)
    end

end
