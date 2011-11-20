class SiteController < ApplicationController

  def index
    @groups = Group.all
  end

  def label_items
    label = Label.find(params[:label_id])
  	@groups = Group.all
    @group_labels = Label.find :all, :conditions => ["group_id=?", label.group.id]
    @label_items = label.items
    # @items = Item.find :all, :conditions => ["group_id=?", params[:group_id]]
  end

  def item
	@item = Item.find(params[:id])
  end

end
