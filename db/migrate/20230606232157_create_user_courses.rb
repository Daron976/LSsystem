class CreateUserCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :user_courses do |t|
      t.integer :user_id, :null => false
      t.integer :course_id, :null => false

      t.timestamps
    end

    add_index :user_courses, [:user_id, :course_id], unique: true
  end
end
