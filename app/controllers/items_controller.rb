class ItemsController < ApplicationController
	def index
	    @items = Item.all
	end

	def new
		@item = Item.new
		2.times { @item.attrs.build }
		4.times { @item.photos.build }
		@groups = Group.all
		@attr_types = AttrType.all
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

	def show
    	@item = Item.find(params[:id])
	end

	def edit
		@item = Item.new
		@groups = Group.all
	end


end