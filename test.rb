require 'digest'
require "base64"
require "cgi"

body = File.read("test.xml").strip
s = "#{body}123456"
# p Base64.encode64(Digest::MD5.hexdigest(s))

token = Digest::MD5.base64digest(s) 

puts token

esc_body = CGI.escape(body)

cmd = <<-CMD
 curl -X POST -d 'logistics_interface=#{esc_body}&data_digest=#{token}&type=online&clientId=K10101010' http://112.64.239.247:7800/CommonOrderModeBServlet.action
CMD

puts cmd

puts `#{cmd}`
