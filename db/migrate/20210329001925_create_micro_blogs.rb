class CreateMicroBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :micro_blogs do |t|
      t.string :title
      t.text :content, :limit => 1000000000
      t.timestamps
    end
  end
end
