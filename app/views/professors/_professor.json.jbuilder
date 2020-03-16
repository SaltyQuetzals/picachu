json.extract! professor, :id, :first_name, :last_name, :full_name, :display_name, :cv_url, :tamu_dir_title, :tamu_dir_dept, :tamu_dir_email, :created_at, :updated_at
json.url professor_url(professor, format: :json)
