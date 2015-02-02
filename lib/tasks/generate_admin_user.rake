desc 'Generate the first admin user'
namespace :admin do
  task generate: :environment do
    User.create!(email: ENV.fetch('ADMIN_USER_EMAIL'),
                 password: ENV.fetch('ADMIN_USER_PASSWORD'),
                 password_confirmation: ENV.fetch('ADMIN_USER_PASSWORD'))
  end
end
