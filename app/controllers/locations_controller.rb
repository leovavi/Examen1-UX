class LocationsController < ApplicationController
	before_action :loc, only: [:destroy, :show, :edit, :update]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@locations = Location.all.order('Created_at DESC')
	end

	def new
		@location = Location.new
	end

	def create
		@location = current_user.locations.new(location_params)
		@location.save
		redirect_to @location
	end

	def edit
	end

	def show
	end

	def update
		if @location.update(location_params)
			redirect_to @location
		else
			render 'edit'
		end
	end

	def destroy
		@location.destroy
		redirect_to locations_path
	end

	private
		def loc
			@location = Location.find(params[:id])
		end

		def location_params
			params.require(:location).permit(:name)
		end
end
