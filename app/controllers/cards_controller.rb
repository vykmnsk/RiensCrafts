class CardsController < ApplicationController
	def new
		@card = Card.new
	end

	def create
		@card = Card.create(params[:card])

	    respond_to do |format|
	   		flash[:notice] = 'Card created.'
        	format.html { redirect_to(@card) }
        end
 
	end

	def show
    	@card = Card.find(params[:id])
	end

end