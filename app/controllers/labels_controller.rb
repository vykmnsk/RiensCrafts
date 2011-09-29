class LabelsController < ApplicationController
	def index
	    @labels = Label.all
	end

	def new
		@label = Label.new
		# @label.group = Group.new
		@groups = Group.all

	end

	def create
		@label = Label.create(params[:label])

	    respond_to do |fmt|
			if @label.save
			   		flash[:notice] = 'Label created.'
		        	fmt.html { redirect_to(@label) }
		    else 
		    	flash[:error] = 'Problem saving the label!'
		    	fmt.html { render :action => "new" }
	    	end
        end
 
	end

	def show
    	@label = Label.find(params[:id])
	end

	def edit
    	@label = Label.find(params[:id])
    	@groups = Group.all
	end

end