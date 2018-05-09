class ApplicationMailer < ActionMailer::Base
  default from: '"TheMuzzle" <the.muzzle.info@gmail.com>',
  		  reply_to: "stealth.taku@gmail.com"
  layout 'mailer'
end
