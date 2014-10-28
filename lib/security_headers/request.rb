require 'security_headers/parser'
require 'curb'
require 'tempfile'

module SecurityHeaders
  class Request

    def self.headers(domain)
      begin
        head = Curl::Easy.http_head(domain)
        new(Parser.new.parse(head.header_str))
      rescue => error
        puts error
      end
    end

  end
end
