class CreateAnnouncements < ActiveRecord::Migration[6.1]
  def change
    create_table :announcements do |t|
      t.string :title
      t.text :body, :limit => 1000000000
      t.integer :course_id
      t.timestamps
    end
  end
end
