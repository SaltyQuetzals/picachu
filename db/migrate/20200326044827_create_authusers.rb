class CreateAuthusers < ActiveRecord::Migration[6.0]
  def change
    create_table :authusers do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :email
      t.string :hosted_domain
      t.string :location
      t.string :image_url
      t.string :url

      t.timestamps
    end
  end
end
