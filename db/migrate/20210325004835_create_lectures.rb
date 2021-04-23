class CreateLectures < ActiveRecord::Migration[6.1]
  def change
    create_table :lectures do |t|
      t.string :name
      t.string :url
      t.string :guest
      t.integer :course_id
      t.timestamps
    end
  end
end
