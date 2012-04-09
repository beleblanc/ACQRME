module ApplicationHelper


  def sign_in_box
    if user_signed_in?
      puts "<p>Signed in as #{current_user.email}</p>"
      link_to "Sign Out", destroy_user_session_path, :method => :delete
    else
       puts link_to "Sign up", new_user_registration_path
       link_to "Sign in", new_user_session_path
    end
  end

  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end

end
