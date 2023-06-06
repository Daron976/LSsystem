class AddForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :user_courses, :users, column: :user_id, on_delete: :cascade
    add_foreign_key :user_courses, :courses, column: :course_id, on_delete: :cascade
  end
end
