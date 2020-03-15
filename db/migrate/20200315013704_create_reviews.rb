class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :overall_rating
      t.string :letter_grade
      t.string :semester
      t.integer :year
      t.boolean :course_required
      t.integer :interesting
      t.integer :difficult
      t.boolean :standardized_course
      t.string :course_other_thoughts
      t.boolean :used_textbook
      t.boolean :attendance_mandatory
      t.string :course_format
      t.integer :cared_about_material
      t.integer :open_to_questions
      t.integer :cared_about_students
      t.integer :clear_grading
      t.integer :homework_heavy
      t.integer :clear_explanations
      t.integer :fast_grading
      t.string :professor_other_thoughts
      t.references :professor, foreign_key: {on_delete: :cascade}
      t.references :course, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
