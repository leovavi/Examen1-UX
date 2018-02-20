class LocationsController < ApplicationController
	def index
		@locations = Location.all.order('Created_at DESC')
	end
end
