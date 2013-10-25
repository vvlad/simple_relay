#require "simple_relay/version"

require 'eventmachine'
require 'mail'
require 'pp'

module SimpleRelay
  class Client < EM::P::SmtpClient

    def invoke_mail_from
      super
      puts "begin proxy"
      proxy_incoming_to(@args[:connection])
      @args[:connection].proxy_incoming_to(self)
    end


  end

  class Server < EM::P::SmtpServer

    attr_accessor :accounts

    def process_mail_from sender
      sender = Mail::Address.new(sender).address
      if account = accounts[sender]
        account = account.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
        account[:auth] = account[:auth].inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
        Client.send account.merge( connection: self, from: sender )
      else
        send_data "550 sender is not matching any known accounts #{@accounts.keys.join(",")}\r\n"
        close_connection_after_writing
      end
    end


  end
end


