require 'readline'

desc 'Add admin of upper level'
task :add_admin => :environment do
  login = Readline::readline('Login: ')
  pass  = Readline::readline('Password: ')
  email = Readline::readline('Email: ')

  u = User.new
  u.login = login
  u.password = pass
  u.password_confirmation = pass
  u.first_name = 'Admin'
  u.last_name = 'Admin'
  u.email = email

  begin
    u.save!
    u.has_role! :admin
    puts "User '#{u.login}' created successfully!"
  rescue 
    puts "There were problems with creating a user:"
    puts u.errors.full_messages
  end
end
