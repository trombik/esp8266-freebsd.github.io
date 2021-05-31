# frozen_string_literal: true

require "json"
require "pp"

src = ARGV[0]

json_orig = File.read(src)
hash_orig = JSON.parse(json_orig)
hash_orig["packages"].each do |package|
  package["maintainer"] = "Tomoyuki Sakurai"
  package["websiteURL"] = "https://github.com/trombik/esp8266-freebsd.github.io"
  package["help"]["online"] = "https://github.com/trombik/esp8266-freebsd.github.io"

  package["platforms"].each do |platform|
    platform["toolsDependencies"] = [] if platform.key?("toolsDependencies")
  end
end

puts JSON.pretty_generate(hash_orig)
