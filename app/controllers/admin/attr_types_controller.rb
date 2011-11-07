class Admin::AttrTypesController < ApplicationController
	def index
	    @attr_types = AttrType.all
	end

	def new
		@attr_type = AttrType.new

	end

	def create
		@attr_type = AttrType.create(params[:attr_type])

	    respond_to do |fmt|
			if @attr_type.save
			   	flash[:notice] = 'New Attribute Type created.'
		        fmt.html { redirect_to([:admin, @attr_type]) }
		    else 
		    	flash[:error] = 'Problem creating Attribute Type!'
		    	fmt.html { render :action => "new" }
	    	end
        end
	end

  	# PUT /attr_types/1
  	def update
    	@attr_type = AttrType.find(params[:id])

    	respond_to do |fmt|
      		if @attr_type.update_attributes(params[:attr_type])
        		flash[:notice] = 'Attribute Type updated.'
        		fmt.html { redirect_to([:admin, @attr_type]) }
      		else
 		    	flash[:error] = 'Problem updating Attribute Type!'
		   		fmt.html { render :action => "edit" }
      		end
    	end
  	end

	def show
    	@attr_type = AttrType.find(params[:id])
	end

	def edit
    	@attr_type = AttrType.find(params[:id])
	end

	 # DELETE /attr_types/1
  	def destroy
    	@attr_type = AttrType.find(params[:id])
    	respond_to do |fmt|
    		if @attr_type.destroy
    			flash[:notice] = 'Attribute Type deleted.'
		    else
				flash[:error] = 'Problem deleting Attribute Type!'
	      	end
	      	fmt.html { redirect_to(admin_attr_types_url) }
	    end
    end

end