require 'json'
require 'net/http'
require 'active_support/core_ext/hash'
require 'HappyMapper'
# s = Net::HTTP.get_response(URI.parse('https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml')).body
# puts Hash.from_xml(s).to_json

# @doc = Nokogiri::XML(File.open('https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml'))
# @doc.xpath("//Cube time="2018-08-27")

# require 'net/http'
# require 'json'
#
# url = 'https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml'
# uri = URI(url)
# response = Net::HTTP.get(uri)
# JSON.parse(response)

class Currencies
  include HappyMapper

  element :time, String
  element :currency, String
  element :rate, String
end

# class Status
#   include HappyMapper
#
#   element :id, Integer
#   element :text, String
#   element :created_at, Time
#   element :source, String
#   element :truncated, Boolean
#   element :in_reply_to_status_id, Integer
#   element :in_reply_to_user_id, Integer
#   element :favorited, Boolean
#   has_one :user, User
# end

statuses = Status.parse('https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml')
statuses.each do |status|
  puts currencies.time, currencies.currency, currencies.rate, ''
end

def foreign_exchange(x,y)
  return x * y
end


print foreign_exchange(1,1.30)
