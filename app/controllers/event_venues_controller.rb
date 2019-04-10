class EventVenuesController < ApplicationController
	def new
		@venue = EventVenue.new
	end

	def venue_params			params.require(:event_venue).permit(:name,:adress,:capacity)
	end

	def create
		@venue = EventVenue.new(venue_params)
		if @venue.save
			redirect_to @venue
		else
			render 'new'
		end
	end

	def update
		@venue = EventVenue.find(params[:id])
		@venue.update!(venue_params)
		redirect_to @venue
	end

	def destroy
		@venue = EventVenue.find(params[:id])
		@venue.destroy
		redirect_to event_venues_path
	end

end
