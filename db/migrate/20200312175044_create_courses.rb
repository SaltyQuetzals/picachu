class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :dept
      t.string :course_num
      t.string :name

      t.timestamps
    end
  end
end
