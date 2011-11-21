class SiteController < ApplicationController

	def index
		@groups = Group.all
	end

	def label_items
		@groups = Group.all
		@label = Label.find(params[:label_id])
		@group = @label.group
		@group_labels = Label.find :all, :conditions => ["group_id=?", @group.id]
		@items = @label.items
		render 'items'
	end

	def group_items
		@groups = Group.all
		@group = Group.find(params[:group_id])
		@group_labels = Label.find :all, :conditions => ["group_id=?", @group.id]
		@items = @group.items  
		render 'items'
	end

	def item_show
		@item = Item.find params[:id]
		@groups = Group.all
		@group = @item.group		
		@group_labels = Label.find :all, :conditions => ["group_id=?", @group.id]
	end

end
