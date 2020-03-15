class CreateProfessors < ActiveRecord::Migration[6.0]
  def change
    create_table :professors do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :full_name, null: false
      t.string :display_name, null: false
      t.string :cv_url
      t.string :tamu_dir_title
      t.string :tamu_dir_dept
      t.string :tamu_dir_email

      t.timestamps
    end
  end
end
