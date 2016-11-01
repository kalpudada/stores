class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.string :city
      t.time :opening_time
      t.time :closing_time
      t.string :location
      t.string :cover_image

      t.timestamps
    end
  end

end
