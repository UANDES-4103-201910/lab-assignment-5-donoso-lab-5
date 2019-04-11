class EventsController < ApplicationController
	def new
		@event = Event.new
	end

	def event_params			params.require(:event).permit(:name,:description,:start_date)
	end

	def create
		@event = Event.new(event_params)
		respond to do |format|		
			if @event.save
				format.html {redirect_to @event}
				format.json {render json: @event}
			else
				format.html {render 'new'}
				format.json {render json: @event.errors, status: :not_found}
			end
	end

	def update
		@event = Event.find(params[:id])
		respond to do |format|	
			@event.update!(event_params)
			format.html {redirect_to @event}
			format.json {render status: :no_content}
	end

	def destroy
		@event = Event.find(params[:id])
		respond to do |format|	
			@event.destroy
			format.html {redirect_to @event}
			format.json {render status: :reset_content}
	end
	
	def index 
		@event = Event.all
	end
	
	def show
		@event = Event.find(params[:id])
	end

end
