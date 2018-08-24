# 1. Use the Reddit API to get info for that subreddit (for example, if the user chooses the “programming” subreddit, the API url would be https://www.reddit.com/r/programming/.json)
# 2. list all posts for programming subreddit
# 3. make it dynamic by asking the user to enter a name for a subreddit
#   3a. If the subreddit exists, display all the posts
#   3b. If the subreddit doesn’t exist or there is an error, display an error message

# Bonus: After displaying all the posts from a subreddit, allow the user to enter a number to see the comments for a given post. You’ll need to make a second web request to get the comments!

require 'http'

system 'clear'

print "Enter a subreddit name: "
subreddit = gets.chomp

response = HTTP.get("https://www.reddit.com/r/#{subreddit}/.json")

if response.code != 200
  puts "Try again dummy!"
else
  posts = response.parse

  user_posts = posts["data"]["children"]

  user_posts.each do |child|
    p "#{child["data"]["title"]}"
  end
end