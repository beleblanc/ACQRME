class AddQrToUsers < ActiveRecord::Migration
  def self.up
     change_table :users do |t|
       t.has_attached_file :qrcode
     end
   end

   def self.down
     drop_attached_file :users, :qrcode
   end
 end
