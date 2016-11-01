class StoresController < ApplicationController
	def index
		# page_id is used to find stores greater than this value
		# @limit_count is used to set number of stores for all queries and set it to 3 for now
		@limit_count = 3
		if !params[:page].blank?
			page_id = ((params[:page].to_i - 1) * @limit_count)
		else
			page_id = 0
		end
		@stores = Store.where('id >?',page_id).limit(@limit_count)
		if !@stores.blank?
			@total_count =  Store.all.count
		end
	end

	def show
		@store = Store.find_by_city(params[:id])
	end

	def new
		@new_store = Store.new
	end

	def create
		if !params[:store][:city].blank?
			new_store = Store.new
			new_store.cover_image = params[:store][:cover_image]
			new_store.city = params[:store][:city]
			new_store.location = params[:store][:location]
			new_store.opening_time = params[:store][:opening_time]
			new_store.closing_time = params[:store][:closing_time]
			new_store.save!
			flash[:notice] = "Store Created!"
    	redirect_to :action => "index"
    else
    	flash[:notice] = "City can't be blank"
		end
	end
end
