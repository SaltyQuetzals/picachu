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

ActiveRecord::Schema.define(version: 2020_03_07_032938) do

  create_table "professors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "full_name"
    t.string "display_name"
    t.string "cv_url"
    t.string "tamu_dir_title"
    t.string "tamu_dir_dept"
    t.string "tamu_dir_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "professor_id"
    t.integer "overall_rating"
    t.string "letter_grade"
    t.string "semester"
    t.decimal "year"
    t.boolean "course_required"
    t.boolean "attendance_mandatory"
    t.string "course_format"
    t.integer "interesting"
    t.integer "difficult"
    t.boolean "standardized_course"
    t.string "course_other_thoughts"
    t.boolean "used_textbook"
    t.integer "cared_about_material"
    t.integer "open_to_questions"
    t.integer "cared_about_students"
    t.integer "clear_grading"
    t.integer "homework_heavy"
    t.integer "clear_explanations"
    t.integer "fast_grading"
    t.string "professor_other_thoughts"
  end

end
