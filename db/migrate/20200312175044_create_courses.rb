class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :dept, null: false
      t.string :course_num, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
