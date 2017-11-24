class ApplicationMailer < ActionMailer::Base
  default from: %Q{"Tiny Santa" <fauxparse@gmail.com>}
  layout 'mailer'
end
