require 'json'
require 'net/http'
require 'active_support/core_ext/hash'
s = Net::HTTP.get_response(URI.parse('https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml')).body
puts Hash.from_xml(s).to_json



def foreign_exchange(x,y)
  return x * y
end

print foreign_exchange(45,1.11)
