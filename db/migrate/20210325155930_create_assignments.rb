class CreateAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :assignments do |t|
      t.string :name
      t.text :content, :limit => 1000000000
      t.string :url
      t.integer :course_id
      t.timestamps
    end
  end
end
