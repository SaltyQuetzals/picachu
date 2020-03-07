class AddReviewAttributes < ActiveRecord::Migration[6.0]
  def change
      add_column :reviews, :overall_rating, :integer
      add_column :reviews, :letter_grade, :string
      add_column :reviews, :semester, :string
      add_column :reviews, :year, :number


      add_column :reviews, :course_required, :boolean
      add_column :reviews, :attendance_mandatory, :boolean
      add_column :reviews, :course_format, :string
      add_column :reviews, :interesting, :integer
      add_column :reviews, :difficult, :integer
      add_column :reviews, :standardized_course, :boolean
      add_column :reviews, :course_other_thoughts, :string

      add_column :reviews, :used_textbook, :boolean
      add_column :reviews, :cared_about_material, :integer
      add_column :reviews, :open_to_questions, :integer
      add_column :reviews, :cared_about_students, :integer
      add_column :reviews, :clear_grading, :integer
      add_column :reviews, :homework_heavy, :integer
      add_column :reviews, :clear_explanations, :integer
      add_column :reviews, :fast_grading, :integer
      add_column :reviews, :professor_other_thoughts, :string
  end
end
