class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string "name", :limit=>"25"
      t.string "password"
      t.timestamps
    end
  end
end
