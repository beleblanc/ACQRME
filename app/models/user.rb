
class User < ActiveRecord::Base
 include QREncoder

  has_one :details, :foreign_key => :user_id
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 has_attached_file :qrcode, :styles => { :medium => "300x300>", :thumb => "100x100>" }
   # Setup accessible (or protected) attributes for your model

  before_create :setsubdomain


  attr_accessible :email, :password, :password_confirmation, :remember_me

protected
  #every new user should have their own subdomain, and qrcode, once qr code is created send it to our
 #production line email
  def setsubdomain
    if User.find_by_subdomain(self.email.to_s.split("@")[0].delete(".")).nil?
      self.subdomain= self.email.split("@")[0].to_s.delete(".")
      createqrcode(self.subdomain)
    end
  end

  def createqrcode(sub)
    code = QREncoder.encode( "#{sub}.acqrme.dev", {:version => 1, :correction=>:high}).png({:pixels_per_module =>2, :transparent => true})
    code.save("/Users/benoit/RubymineProjects/ACQRME/public/images/qrcode/#{self.subdomain}.png")
    self.qrcode_file_name = "/images/qrcode/#{self.subdomain}.png"
    self.qrcode_content_type="png"

  end

end
