class ProfilesController < ApplicationController
  before_action :set_user_and_profile, only: [ :show, :edit, :update ]
  def show
    # @profile = current_user.profile
  end

  def edit
  end


  def update
    ActiveRecord::Base.transaction do
      if profile_params[:gender] == "other" && profile_params[:custom_field].present?
        @profile.gender = profile_params[:custom_field]
      else
        @profile.gender = profile_params[:gender]
      end

      if @profile.update(profile_params.except(:gender, :custom_field))
        redirect_to user_profile_path(@user), notice: "Profile updated successfully"
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end



  private

  def set_user_and_profile
    @user = User.find(params[:user_id])
    @profile = @user.profile
  end

  # def profile_params
  #   params.require(:profile).permit(:bio, :avatar_url)
  # end
  def set_user_and_profile
    @user = User.find(params[:user_id])
    @profile = @user.profile
  end

  def profile_params
    params.require(:profile).permit(:username, :birthday, :gender, :custom_field, :location, :bio, :avatar_url)
  end
end


# def show
#   # @profile = current_user.profile
# end

# def edit
# end

# def update
#   if @user.profile.update(profile_params)
#     redirect_to user_profile_path(@user), notice: "Profile updated successfully"
#   else
#     render :edit
#   end
# end
