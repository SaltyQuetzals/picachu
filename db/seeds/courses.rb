require 'json'
require 'cgi'
require 'nokogiri'

COURSE_FILE_PATH = 'db/courses.json'

PATTERN = /^(\([^\)]+\) )?(.*)$/m
course_file = File.read(COURSE_FILE_PATH)
course_data = JSON.parse(course_file)
records_to_insert =
  course_data.map do |summary|
    name = if summary['courseDescription'].strip == 'No course description is available.' then
             Nokogiri::HTML.fragment(summary['courseTitle']).to_s.strip#.titleize
           else
             matches = summary['courseDescription'].split('.')[0].match(PATTERN)
             if matches.length < 2
               Nokogiri::HTML.fragment(summary['courseTitle']).to_s.strip#.titleize
             else
               matches[2]
             end
           end
    {
      dept: summary['subject'],
      course_num: summary['courseNumber'],
      name: name,
      description: summary['courseDescription'] == 'No course description is available.' ? nil : summary['courseDescription']
    }
  end
Course.create(records_to_insert)
