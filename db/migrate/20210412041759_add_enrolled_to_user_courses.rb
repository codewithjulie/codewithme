class AddEnrolledToUserCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :user_courses, :enrolled, :boolean, default: false
  end
end
