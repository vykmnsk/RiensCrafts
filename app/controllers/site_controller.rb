class SiteController < ApplicationController

  def index
    @groups = Group.all
  end

  def label_items
    @items = Item.all
  end

  def item
	@item = Item.find(params[:id])
  end

end
