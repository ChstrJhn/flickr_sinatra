class CreatePhotos < ActiveRecord::Migration
  def change
  	create_table :photos do |t|
  		t.string :file
  		t.integer :album_id
  		t.integer :user_id
  		t.string :description
  		t.timestamps null:false
  	end
  end
end
