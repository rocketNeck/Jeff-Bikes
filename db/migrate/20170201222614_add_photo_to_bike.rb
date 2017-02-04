class AddPhotoToBike < ActiveRecord::Migration[5.0]
  def change
    add_column :bikes, :photo, :string
  end
end
