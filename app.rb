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

get("/dog") do
  url = "https://random.dog/woof.json"
  raw = HTTP.get(url)

  raw_string = raw.to_s

  parsed_string = JSON.parse(raw_string)

  @animal_pic = parsed_string.fetch("url")

  pp @animal
  erb(:dog)
end

get("/cat") do
  url = "https://api.thecatapi.com/v1/images/search?limit=1"
  raw_data = HTTP.get(url)
  parsed_string = JSON.parse(raw_data)

  cat_aray = parsed_string[0]

  @cat_pic = cat_aray.fetch("url")

  erb(:cat)
end

get("/duck") do
  url = "https://random-d.uk/api/v2/random"
  raw_data = HTTP.get(url)
  parsed_string = JSON.parse(raw_data)
  @duck_pic = parsed_string.fetch("url")

  erb(:duck)
end

get("/fox") do
  url = "https://randomfox.ca/floof/"

  raw_data = HTTP.get(url)
  parsed_string = JSON.parse(raw_data)
  @fox_pic = parsed_string.fetch("image")

  erb(:fox)
end

get("/random") do
  url = "https://random.dog/woof.json"
  raw = HTTP.get(url)

  raw_string = raw.to_s

  parsed_string = JSON.parse(raw_string)

  @animal_pic = parsed_string.fetch("url")

  url = "https://api.thecatapi.com/v1/images/search?limit=1"
  raw_data = HTTP.get(url)
  parsed_string = JSON.parse(raw_data)

  cat_aray = parsed_string[0]

  @cat_pic = cat_aray.fetch("url")

  url = "https://random-d.uk/api/v2/random"
  raw_data = HTTP.get(url)
  parsed_string = JSON.parse(raw_data)
  @duck_pic = parsed_string.fetch("url")

  url = "https://randomfox.ca/floof/"

  raw_data = HTTP.get(url)
  parsed_string = JSON.parse(raw_data)
  @fox_pic = parsed_string.fetch("image")

  random_array = [@cat_pic, @fox_pic, @animal_pic, @duck_pic]

  @random_pic = random_array.sample

  erb(:random)
end
