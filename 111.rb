require 'digest'
require "base64"

body = File.read("/tmp/111.xml").strip
s = "#{body}123456"
# p Base64.encode64(Digest::MD5.hexdigest(s))

token = Digest::MD5.base64digest(s) 

puts token

cmd = <<-CMD
 curl -X POST -d 'logistics_interface=#{body}&data_digest=#{token}&type=online&clientId=K10101010' http://112.64.239.247:7800/api!synWaybill.action
CMD

puts cmd

puts `#{cmd}`
