class CreateSocialAddresses < ActiveRecord::Migration
  def change
    create_table :social_addresses do |t|
      t.integer :user_id
      t.string :credentials
      t.integer :social_type_id

      t.timestamps
    end
  end
end
