class CreateSubmissions < ActiveRecord::Migration[6.1]
  def change
    create_table :submissions do |t|
      t.text :body
      t.string :url
      t.integer :user_id
      t.integer :assignment_id
      t.timestamps
    end
  end
end
