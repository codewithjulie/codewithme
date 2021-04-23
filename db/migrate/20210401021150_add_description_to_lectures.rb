class AddDescriptionToLectures < ActiveRecord::Migration[6.1]
  def change
    add_column :lectures, :description, :text, :limit => 1000000000
  end
end
