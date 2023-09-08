require 'digest/md5'

desc "Hash users passwords to md5"
task hash_passwords: :environment do |_task, _args|
  begin
    hash_users_passwords
  rescue StandardError => e
    puts e
  end
end

def hash_users_passwords
  Account.all.each do |user|
    user.update(
      Password_hash: Digest::MD5.hexdigest(user.Password_hash)
    )
    puts "Hashed password for #{user.Username}"
  end
end
