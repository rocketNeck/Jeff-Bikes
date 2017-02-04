class CreateBikeTags < ActiveRecord::Migration[5.0]
  def change
    create_table :bike_tags do |t|
      t.belongs_to :bike, foreign_key: true
      t.belongs_to :tag, foreign_key: true
      t.timestamps
    end
  end
end
