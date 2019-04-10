class TicketsController < ApplicationController
	def new
		@ticket = Ticket.new
	end

	def ticket_params			params.require(:ticket).permit(:ticket_order,:order)
	end

	def create
		@ticket = Ticket.new(ticket_params)
		if @ticket.save
			redirect_to @ticket
		else
			render 'new'
		end
	end

	def update
		@ticket = Ticket.find(params[:id])
		@ticket.update!(ticket_params)
		redirect_to @ticket
	end

	def destroy
		@ticket = Ticket.find(params[:id])
		@ticket.destroy
		redirect_to tickets_path
	end

end
