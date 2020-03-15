class CreateJoinTableReviewTag < ActiveRecord::Migration[6.0]
  def change
    create_join_table :reviews, :tags do |t|
    end
  end
end
