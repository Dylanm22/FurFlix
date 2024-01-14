require "sinatra"
require "sinatra/reloader"
require "http"

#making a web app that ask for animal name then app puts out a picture of said animal and a random name for animal







get("/") do
  
  
  
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "

erb(:home)

end


get("/:animal") do

  url = "https://random.dog/woof.json"
  raw = HTTP.get(url)
  
 
  raw_string = raw.to_s

parsed_string = JSON.parse(raw_string)
  
@animal_pic = parsed_string.fetch("url")
 
  pp @animal
  erb(:animal_page)


end
