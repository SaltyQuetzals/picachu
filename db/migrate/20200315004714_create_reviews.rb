class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      # Review-specific
      t.integer :overall_rating,
                                 null: false
      t.string :letter_grade, null: false
      t.string :semester, null: false
      t.integer :year, null: false

      # Course-specific
      t.boolean :course_required
      t.integer :interesting
      t.integer :difficult
      t.boolean :standardized_course
      t.string :course_other_thoughts

      # Professor-specific
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

      # Relations
      t.belongs_to :professor, null: false, foreign_key: true
      t.belongs_to :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
