require 'http'

system "clear"

print "City: "
input_city = gets.chomp

print "State: "
input_state = gets.chomp

response = HTTP.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22#{input_city}%2C%20#{input_state}}%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys") # GET request from that link

data = response.parse 

channel = data["query"]["results"]["channel"] # Digging in (from the webpage)

temp_unit = channel["units"]["temperature"]

condition = channel["item"]["condition"]["text"]
temperature = channel["item"]["condition"]["temp"]
city = channel["location"]["city"]
state = channel["location"]["region"]
# p city
# p state

puts "In #{city},#{state}, it is currently #{temperature}° #{temp_unit} and #{condition}"