class RecordingsController < ApplicationController
	before_action :authenticate_user!

	def create
		@location = Location.find(params[:location_id])
		@recording = @location.recordings.build(recordings_params)
		@recording.user_id = current_user.id if current_user

		if @recording.save
			redirect_to @location
		else
			render :new
		end
	end

	def new
		@location = Location.find(params[:location_id])
		@recording = @location.recordings.build
	end

	def destroy
	  @location = Location.find(params[:location_id])
	  @recording = @location.recordings.find(params[:id])
	  @recording.destroy
	  redirect_to @location
	end

	private
		def recordings_params
			params.require(:recording).permit(:temp, :status)
		end
end
