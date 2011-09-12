class PhotosController < ApplicationController
	def index
	    @photos = Photo.all
	end

	def new
		@photo = Photo.new
	end

	def create
		@photo = Photo.create(params[:photo])

	    respond_to do |format|
			if @photo.save
			   		flash[:notice] = 'Photo created.'
		        	format.html { redirect_to(@photo) }
		    else 
		    	flash[:error] = 'Problem saving the photo!'
		    	format.html { render :action => "new" }
	    	end
        end
 
	end

	def show
    	@photo = Photo.find(params[:id])
	end

end