class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string "name", :limit=>50
      t.string "college", :limit=>50
      t.integer "year"
      t.string "department"
      t.string "mobile"
      t.string "email", :default=>"", :null=>false
      t.timestamps
    end
  end
end
