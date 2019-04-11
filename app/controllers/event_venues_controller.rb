class EventVenuesController < ApplicationController
	def new
		@venue = EventVenue.new
	end

	def venue_params			params.require(:event_venue).permit(:name,:adress,:capacity)
	end

	def create
		@venue = EventVenue.new(venue_params)
		respond to do |format|		
			if @venue.save
				format.html {redirect_to @venue}
				format.json {render json: @venue}
			else
				format.html {render 'new'}
				format.json {render json: @venue.errors, status: :not_found}
			end
	end

	def update
		@venue = EventVenue.find(params[:id])
		respond to do |format|	
			@venue.update!(venue_params)
			format.html {redirect_to @venue}
			format.json {render status: :no_content}
	end

	def destroy
		@venue = EventVenue.find(params[:id])
		respond to do |format|	
			@venue.destroy
			format.html {redirect_to @venue}
			format.json {render status: :reset_content}
	end

	def index 
		@venue = EventVenue.all
	end
	
	def show
		@venue = EventVenue.find(params[:id])
	end


end
