class Details < ActiveRecord::Base
  belongs_to :user, :foreign_key => :id
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

end
