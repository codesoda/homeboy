require 'rubygems'
require 'bundler'
Bundler.require

disable :protection

set :root, File.dirname(__FILE__)

configure :development do
  Mail.defaults do
    delivery_method :smtp, address: "localhost", port: 1025
  end
end

configure :production do
  Mail.defaults do
    delivery_method :smtp, {
      :address => ENV['MAIL_SERVER'],
      :port => 587,
      :domain => ENV['HOST'],
      :user_name => ENV['MAIL_USERNAME'],
      :password => ENV['MAIL_PASSWORD'],
      :authentication => 'plain',
      :enable_starttls_auto => true
    }
  end
end

get '*' do
  et_phone_home request
end

put '*' do
  et_phone_home request
end

post '*' do
  et_phone_home request
end
patch '*' do
  et_phone_home request
end

delete '*' do
  et_phone_home request
end

def et_phone_home request
  @request = request
  body_text = erb :hello
  Mail.deliver do
    from    ENV['MAIL_TO']
    to      ENV['MAIL_FROM']
    subject "et phone... #{request.path}"
    body    body_text
  end
end
