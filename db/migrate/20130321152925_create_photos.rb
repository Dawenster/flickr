class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :url, :null => false, :unique => true
      t.string :thumb, :unique => true
      t.references :album
      t.timestamps
    end
  end
end
