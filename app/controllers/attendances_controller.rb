class AttendancesController < ApplicationController

	def create
		@user = User.find_by(id: session[:user_id])
		@concert = Concert.find_by(id: params[:info][:concert_id])
		@attendance = Attendance.create(user_id: @user.id, concert_id: @concert.id)
		redirect_to "/concerts/#{@concert.id}"
	end

end