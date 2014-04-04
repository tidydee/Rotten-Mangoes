class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :email
      t.string   :password_digest
      t.string   :firstname
      t.string   :lastname
      t.boolean  :admin, default: false
      t.timestamps
    end

    create_table :movies do |t|
      t.string   :title
      t.string   :director
      t.integer  :runtime_in_minutes
      t.text     :description
      t.string   :poster_image_url
      t.datetime :release_date
      t.string   :image
      t.timestamps
    end

    create_table :reviews do |t|
      t.integer  :user_id
      t.integer  :movie_id
      t.text     :text
      t.integer  :rating_out_of_ten
      t.timestamps
    end    
  end
end
