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
