class CardsController < ApplicationController
	def index
	    @cards = Card.all
	end

	def new
		@card = Card.new
	end

	def create
		@card = Card.create(params[:card])

	    respond_to do |format|
			if @card.save
			   		flash[:notice] = 'Card created.'
		        	format.html { redirect_to(@card) }
		    else 
		    	flash[:error] = 'Problem saving the card!'
		    	format.html { render :action => "new" }
	    	end
        end
 
	end

	def show
    	@card = Card.find(params[:id])
	end

end