class TicketsController < ApplicationController
	def new
		@ticket = Ticket.new
	end

	def ticket_params			params.require(:ticket).permit(:ticket_order,:order)
	end

	def create
		@ticket = Ticket.new(ticket_params)
		respond to do |format|		
			if @ticket.save
				format.html {redirect_to @ticket}
				format.json {render json: @ticket}
			else
				format.html {render 'new'}
				format.json {render json: @ticket.errors, status: :not_found}
			end
	end

	def update
		@ticket = Ticket.find(params[:id])
		respond to do |format|	
			@ticket.update!(ticket_params)
			format.html {redirect_to @tiicket}
			format.json {render status: :no_content}
	end

	def destroy
		@ticket = Ticket.find(params[:id])
		respond to do |format|	
			@ticket.destroy
			format.html {redirect_to @ticket}
			format.json {render status: :reset_content}
	end
	def index 
		@ticket = Ticket.all
	end
	
	def show
		@ticket = Ticket.find(params[:id])
	end


end
