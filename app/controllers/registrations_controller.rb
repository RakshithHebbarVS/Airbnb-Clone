class RegistrationsController < Devise::RegistrationsController



private
	def sign_up_params
		params[:user].permit(:email, :username, :password, :password_confirmation, role_ids: [])
	end

end