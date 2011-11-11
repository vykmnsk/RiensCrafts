class Admin::LabelsController < ApplicationController
	before_filter :authenticate_user!

	def index
	    @labels = Label.all
	end

	def new
		@label = Label.new
		@groups = Group.all
	end

	def show
    	@label = Label.find(params[:id])
	end

	def edit
    	@label = Label.find(params[:id])
    	@groups = Group.all
	end

	def create
		@label = Label.create(params[:label])

	    respond_to do |fmt|
			if @label.save
			   	flash[:notice] = 'Label created.'
		        fmt.html { redirect_to([:admin, @label]) }
		    else 
		    	flash[:error] = 'Problem updating label!'
		    	fmt.html { render :action => "new" }
	    	end
        end
 
	end
  	# PUT /labels/1
  	def update
    	@label = Label.find(params[:id])

    	respond_to do |fmt|
      		if @label.update_attributes(params[:label])
        		flash[:notice] = 'Label updated.'
        		fmt.html { redirect_to([:admin, @label]) }
      		else
 		    	flash[:error] = 'Problem updating Label!'
		   		fmt.html { render :action => "edit" }
      		end
    	end
  	end

	 # DELETE /labels/1
  	def destroy
    	@label = Label.find(params[:id])

    	respond_to do |fmt|
    		if @label.destroy
    			flash[:notice] = 'Label deleted.'
		    else
				flash[:error] = 'Problem deleting Label!'
	      	end
	      	fmt.html { redirect_to(admin_labels_url) }
	    end
    end	

end