class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.string :first_name , :length => 30
      t.string :last_name  , :length => 30
      t.string :address  ,  :length => 100
      t.string :city  , :length => 30
      t.string :country  , :length => 30
      t.string :mobile  ,  :length => 15
      t.string :phone  ,  :length => 15
      t.string :fax  ,  :length => 15
      t.has_attached_file :avatar

      t.timestamps
    end
  end
end
