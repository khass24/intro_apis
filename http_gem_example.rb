require "http" # adds in the HTTP gem that was previously installed

response = HTTP.get("https://data.cityofchicago.org/resource/xzkq-xp2w.json") # GET request from that web page

response.parse # gets the data in its pure form

# puts response.body.readpartial # formats the data that was received

data = response.parse # Defines variable 'data' for the loop

data.each do |employee_hash| # Call each loop called on an array (the data set)
  puts "#{employee_hash["name"]} works as a #{employee_hash["job_titles"]} in the #{employee_hash["department"]} department"
end