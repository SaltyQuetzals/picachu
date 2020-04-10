class AddAuthuserToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :authuser_id, :integer
  end
end
