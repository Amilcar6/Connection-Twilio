require 'rubygems'
require 'sinatra'
require 'twilio-ruby'
 
get '/' do
    # Find these values at twilio.com/user/account
    account_sid = 'AC910160278996f9a9a73d7371ad59ada8'
    auth_token = '55efb1f256a4aa6cee97301f77e01d7b'
    # This application sid will play a Welcome Message.
    demo_app_sid = 'AP8218c946c1e5f0ae71be2d1ec1e818a3'
    capability = Twilio::Util::Capability.new account_sid, auth_token
    capability.allow_client_outgoing demo_app_sid
	capability.allow_client_incoming "tommy"
    token = capability.generate
    erb :index, :locals => {:token => token}
end

