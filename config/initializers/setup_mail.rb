ActionMailer::Base.smtp_settings = {
  :address  => "smt.gmail.com",
  :port     => 587,
  :domain   => "acqrme.dev",
  :user_name => "ben.leblanc",
  :password  => "nxumalo7",
  :authentication => "plain",
  :enable_starttls_auto => true
}