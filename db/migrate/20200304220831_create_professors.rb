# frozen_string_literal: true

class CreateProfessors < ActiveRecord::Migration[6.0]
  def change
    create_table :professors do |t|
      t.string :first_name
      t.string :last_name
      t.string :full_name
      t.string :display_name
      t.string :tamu_dir_title, null: true
      t.string :tamu_dir_dept, null: true
      t.string :tamu_dir_email, null: true

      t.timestamps
    end
    add_index :professors, :display_name
  end
end
