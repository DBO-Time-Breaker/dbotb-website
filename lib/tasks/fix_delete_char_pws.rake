desc "Fix Delete Char Passwords"
task fix_delete_char_pws: :environment do |_task, _args|
  begin
    set_users_delete_passwords
  rescue StandardError => e
    puts e
  end
end

def set_users_delete_passwords
  Account.all.each do |user|
    user.update(
      del_char_pw: user.Password_hash
    )
    puts "Updated delete char password for #{user.Username}"
  end
end
