class Admin::ItemsController < ApplicationController
	respond_to :html, :js

	def index
	    @items = Item.all
	end

	def new
		@item = Item.new
		@group_labels = Label.all		
		2.times { @item.attrs.build }
		@attr_types_map = AttrType.all.map {|at| [at.name, at.id]}
		4.times { @item.photos.build }
	end

	def show
    	@item = Item.find(params[:id])
	end

	def edit
		@item = Item.find(params[:id])
		@group_labels = Label.find(:all, :conditions => ['group_id = ?', @item.group.id])
		@item_label_ids = @item.labels.all.collect {|il| il.id}
		2.times { @item.attrs.build }
		@attr_types_map = AttrType.all.map {|at| [at.name, at.id]}
		4.times { @item.photos.build }

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

	    if params[:prev_label_ids]
	    	prev_label_ids = params[:prev_label_ids].keys {|id| id.to_i}
	    end    	
    	if params[:curr_label_ids]
	    	curr_label_ids = params[:curr_label_ids].keys {|id| id.to_i}
	    end
	    
    	if prev_label_ids
    		prev_label_ids.each do |id|
    			unless curr_label_ids and curr_label_ids.include?(id)
    				@item.labels.delete Label.find(id)
    			end
    		end
    	end
    	if curr_label_ids
    		curr_label_ids.each do |id|
    			unless prev_label_ids and prev_label_ids.include?(id)
    				@item.labels << Label.find(id)
    			end
    		end
    	end    	

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

    def refresh_group_labels
			@group_labels = Label.find(:all, :conditions => ['group_id = ?', params[:group_id]])
    	# @item = Item.find(params[:item_id])
			# @item_label_ids = @item.labels.all.collect {|il| il.id}
			# render :partial => 'group_labels'

    	# flash[:notice] = "Got list of goups" if @group_labels
    	# respond_with( render(:partial => 'group_labels'), :layout => !request.xhr? )

			# respond_with do |wants|
	  		# wants.js {render :layout => false}

			#   wants.html do
			#     if request.xhr?
			#       render :partial => "group_labels"
			#     else
			#       render
			#     end
			#   end
			# end

    	respond_to do |fmt|
    		fmt.html {render :partial => "group_labels"}
	  		# fmt.js {render :layout => false}
			end

    end

end