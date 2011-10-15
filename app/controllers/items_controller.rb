class ItemsController < ApplicationController
	def index
	    @items = Item.all
	end

	def new
		@item = Item.new
		2.times { @item.attrs.build }
		4.times { @item.photos.build }
		@attr_types_map = AttrType.all.map {|at| [at.name, at.id]}
	end

	def show
    	@item = Item.find(params[:id])
	end

	def edit
		@item = Item.find(params[:id])
		2.times { @item.attrs.build }
		4.times { @item.photos.build }
		@attr_types_map = AttrType.all.map {|at| [at.name, at.id]}
	end
	
	def create
		@item = Item.create(params[:item])

	    respond_to do |fmt|
			if @item.save
			   		flash[:notice] = 'Item created.'
		        	fmt.html { redirect_to(@item) }
		    else 
		    	flash[:error] = 'Problem saving the item!'
		    	fmt.html { render :action => "new" }
	    	end
        end
 
	end

  	# PUT /items/1
  	def update
    	@item = Item.find(params[:id])

    	respond_to do |fmt|
      		if @item.update_attributes(params[:item])
        		flash[:notice] = 'item updated.'
        		fmt.html { redirect_to(@item) }
      		else
 		    	flash[:error] = 'Problem updating item!'
		   		fmt.html { render :action => "edit" }
      		end
    	end
  	end

	 # DELETE /items/1
  	def destroy
    	@item = Item.find(params[:id])

    	respond_to do |fmt|
    		if @item.destroy
    			flash[:notice] = 'Item deleted.'
		    else
				flash[:error] = 'Problem deleting Item!'
	      	end
	      	fmt.html { redirect_to(items_url) }
	    end
    end	

end