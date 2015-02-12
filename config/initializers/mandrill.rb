unless Rails.env.development? || Rails.env.test?
  if ENV['MANDRILL_USERNAME'].present? && ENV['MANDRILL_APIKEY']
    ActionMailer::Base.smtp_settings = {
        :port =>           '587',
        :address =>        'smtp.mandrillapp.com',
        :user_name =>      ENV['MANDRILL_USERNAME'],
        :password =>       ENV['MANDRILL_APIKEY'],
        :domain =>         'heroku.com',
        :authentication => :plain
    }
    ActionMailer::Base.delivery_method = :smtp
  end
end
