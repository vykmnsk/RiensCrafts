class Admin::MenuController < ApplicationController
	before_filter :authenticate_user!

	def index
	end
end
