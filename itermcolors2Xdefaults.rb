#!/usr/bin/env ruby
#
#
require 'plist'

def as_default(k)
  red = (k['Red Component'] * 100).to_i.to_s(16)
  green = (k['Green Component'] * 100).to_i.to_s(16)
  blue = (k['Blue Component'] * 100).to_i.to_s(16)

  "##{red}#{green}#{blue}"
end

hash = Plist::parse_xml(ARGV[0])

key = ARGV[1] || "Rxvt"

(0..15).each do |n|
  puts "#{key}*color#{n}:   #{as_default(hash["Ansi #{n} Color"])}"
end





