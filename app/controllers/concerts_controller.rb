class ConcertsController < ApplicationController

	def index
		@concerts = Concert.all.order(date: :ASC)
	end

	def show
		@concert = Concert.find(params[:id])
		@attendees = @concert.users
	end

end