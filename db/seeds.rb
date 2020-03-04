# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'

PROFESSOR_FILE_PATH = 'db/professors.json'
# @type [Hash]
PROFESSOR_DATA = JSON.parse(File.read(PROFESSOR_FILE_PATH))

seed_data = PROFESSOR_DATA.map do |_key, professor_json|
  tamu_dir_title = if professor_json['tamuDirTitle'].empty?
                     nil
                   else
                     professor_json['tamuDirTitle']
                   end
  tamu_dir_dept = if professor_json['tamuDirDept'].empty?
                    nil
                  else
                    professor_json['tamuDirDept']
                  end
  tamu_dir_email = if professor_json['tamuDirEmail'].empty?
                     nil
                   else
                     professor_json['tamuDirEmail']
                   end
  {
    first_name: professor_json['firstName'],
    last_name: professor_json['lastName'],
    full_name: professor_json['fullName'],
    display_name: professor_json['displayName'],
    tamu_dir_title: tamu_dir_title,
    tamu_dir_dept: tamu_dir_dept,
    tamu_dir_email: tamu_dir_email
  }
end
Professor.create(seed_data)
