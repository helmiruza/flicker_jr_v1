class CreatePhotos < ActiveRecord::Migration
  def change
  	create_table :photos do |u|
  		u.string :filename
  		u.integer :album_id
  		u.timestamps null:false
  	end
  end
end
