if Rails.env.development?
    ActionMailer::Base.delivery_method = :smtp

    ActionMailer::Base.smtp_settings = {
      address:              'smtp.mailgun.org',
      port:                 2525,
      authentication:       :plain,
      user_name:            ENV['MAILGUN_SMTP_LOGIN'],
      password:             ENV['MAILGUN_SMTP_PASSWORD'],
      domain:               'heroku.com',
      authentication:       :plain,
      content_type:         'text/html',
    }

    # Makes debugging *way* easier.
    ActionMailer::Base.raise_delivery_errors = true

end