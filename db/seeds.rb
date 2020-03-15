# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'

PROFESSOR_FILE_PATH = 'db/professors.json'

professor_file = File.read(PROFESSOR_FILE_PATH)
professor_data = JSON.parse(professor_file)
records_to_insert =
  professor_data.map do |_key, summary|
    {
      first_name: summary['firstName'],
      last_name: summary['lastName'],
      full_name: summary['fullName'],
      display_name: summary['displayName'],
      cv_url: summary['cvUrl'],
      tamu_dir_email: summary['tamuDirEmail'],
      tamu_dir_title: summary['tamuDirTitle'],
      tamu_dir_dept: summary['tamuDirDept']
    }
  end
Professor.create(records_to_insert)
