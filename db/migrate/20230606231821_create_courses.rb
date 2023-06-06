class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :course, :null => false
      t.text :description, :default => "Unknown description"
      t.date :enrolled_date, :null => false

      t.timestamps
    end

    add_index :courses, :course, unique: true
  end
end
