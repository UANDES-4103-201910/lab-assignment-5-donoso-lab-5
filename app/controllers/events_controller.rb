class EventsController < ApplicationController
	def new
		@event = Event.new
	end

	def event_params			params.require(:event).permit(:name,:description,:start_date)
	end

	def create
		@event = Event.new(event_params)
		if @event.save
			redirect_to @event
		else
			render 'new'
		end
	end

	def update
		@event = Event.find(params[:id])
		@event.update!(event_params)
		redirect_to @event
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy
		redirect_to events_path
	end

end
