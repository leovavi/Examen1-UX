class AddUserToRecording < ActiveRecord::Migration[5.1]
  def change
  	add_reference :rocordings, :user, foreign_key: true
  end
end
