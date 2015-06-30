#!/usr/bin/env ruby
#
#
require 'plist'

MOD = (ENV['ITERM_COLOR_MULTIPLIER'] || 1).to_f

def as_default(k)
  red = (k['Red Component'] * 255 * MOD).to_i.to_s(16)
  green = (k['Green Component'] * 255 * MOD).to_i.to_s(16)
  blue = (k['Blue Component'] * 255 * MOD).to_i.to_s(16)

  "##{red}#{green}#{blue}"
end

hash = Plist::parse_xml(ARGV[0])

key = ARGV[1] || "Rxvt"

puts "#{key}*background:   #{as_default(hash["Background Color"])}"
puts "#{key}*foreground:   #{as_default(hash["Foreground Color"])}"
puts "#{key}*cursorColor:   #{as_default(hash["Cursor Color"])}"

(0..15).each do |n|
  puts "#{key}*color#{n}:   #{as_default(hash["Ansi #{n} Color"])}"
end
