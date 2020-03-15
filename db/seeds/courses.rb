require 'json'

COURSE_FILE_PATH = 'db/courses.json'

course_file = File.read(COURSE_FILE_PATH)
course_data = JSON.parse(course_file)
records_to_insert =
  course_data.map do |summary|
    {
      dept: summary['subject'],
      course_num: summary['course_num'],
      name: summary['course_description'].titleize
    }
  end
Course.create(records_to_insert)
