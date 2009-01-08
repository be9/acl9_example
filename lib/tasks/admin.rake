require 'readline'

desc 'Add admin of level 0'
task :add_admin => :environment do
  login = Readline::readline('Login: ')
  pass  = Readline::readline('Password: ')

  u = User.new
  u.login = login
  u.password = pass
  u.password_confirmation = pass
  
  begin
    u.save!
    u.has_role! :admin_0
    puts "User '#{u.login}' created successfully!"
  rescue 
    puts "There were problems with creating a user:"
    puts u.errors.full_messages
  end
end
