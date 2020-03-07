class AddProfessorIdToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :professor_id, :integer
  end
end
