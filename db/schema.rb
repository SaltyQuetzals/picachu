# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_26_165953) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'authusers', force: :cascade do |t|
    t.string 'provider'
    t.string 'uid'
    t.string 'name'
    t.string 'email'
    t.string 'hosted_domain'
    t.string 'location'
    t.string 'image_url'
    t.string 'url'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'courses', force: :cascade do |t|
    t.string 'dept', null: false
    t.string 'course_num', null: false
    t.string 'name', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'description'
    t.index %w[dept course_num],
            name: 'index_courses_on_dept_and_course_num', unique: true
  end

  create_table 'professors', force: :cascade do |t|
    t.string 'first_name', null: false
    t.string 'last_name', null: false
    t.string 'full_name', null: false
    t.string 'display_name', null: false
    t.string 'cv_url'
    t.string 'tamu_dir_title'
    t.string 'tamu_dir_dept'
    t.string 'tamu_dir_email'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'reviews', force: :cascade do |t|
    t.integer 'overall_rating', null: false
    t.string 'letter_grade', null: false
    t.string 'semester', null: false
    t.integer 'year', null: false
    t.boolean 'course_required'
    t.integer 'interesting'
    t.integer 'difficult'
    t.boolean 'standardized_course'
    t.string 'course_other_thoughts'
    t.boolean 'used_textbook'
    t.boolean 'attendance_mandatory'
    t.string 'course_format'
    t.integer 'cared_about_material'
    t.integer 'open_to_questions'
    t.integer 'cared_about_students'
    t.integer 'clear_grading'
    t.integer 'homework_heavy'
    t.integer 'clear_explanations'
    t.integer 'fast_grading'
    t.string 'professor_other_thoughts'
    t.bigint 'professor_id'
    t.bigint 'course_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[course_id], name: 'index_reviews_on_course_id'
    t.index %w[professor_id], name: 'index_reviews_on_professor_id'
  end

  create_table 'reviews_tags', id: false, force: :cascade do |t|
    t.bigint 'review_id', null: false
    t.bigint 'tag_id', null: false
  end

  create_table 'tags', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'reviews', 'courses', on_delete: :cascade
  add_foreign_key 'reviews', 'professors', on_delete: :cascade
end
