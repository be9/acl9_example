class Notifier < ActionMailer::Base
  default_url_options[:host] = "acl9.example.com"

  def password_reset_instructions(user)
    subject       "Password Reset Instructions"
    from          "Acl9 example Notifier <noreply@acl9.example.com>"
    recipients    user.email
    sent_on       Time.now
    body          :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
  end
end
