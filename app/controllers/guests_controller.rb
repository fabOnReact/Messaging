class GuestsController < ApplicationController

	def new
		@guest = Guest.new
	end

	# if user is logged in, return current_user, else return guest_user
	def current_or_guest_user
		if current_user
		  if session[:guest_user_id] && session[:guest_user_id] != current_user.id
		    logging_in
		    # reload guest_user to prevent caching problems before destruction
		    guest_user(with_retry = false).reload.try(:destroy)
		    session[:guest_user_id] = nil
		  end
		  current_user
		else
		  guest_user
		end
	end

	def guest_user(with_retry = true)
	    # Cache the value the first time it's gotten.
	    @guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)

  		rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
	     session[:guest_user_id] = nil
	     create if with_retry
	     binding.pry
	end

	private

	def input_params
		params.require(:guest).permit(:username, :dialect_id)
	end

	def create_guest_user
		u = Guest.create(:username => input_params[:username], :dialect_id => input_params[:dialect_id])
		u.save!(:validate => false)
		session[:guest_user_id] = u.id
		u
	end
end
