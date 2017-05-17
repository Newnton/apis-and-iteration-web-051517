require 'rest-client'
require 'json'
require 'pry'

def get_film_data(film_ary)
  film_ary.map do |film_URL|
    foo = {}
    film_data = RestClient.get(film_URL)
    film_data_hash = JSON.parse(film_data)
    film_data_hash.each do |key, value|
      if key == "title"
        foo[key] = value
      elsif key == "episode_id"
        foo[key] = value
      end
    end
    foo
  end
end

def find_films(character_hash, character)
  ret = []
  counter = -1
  character_hash["results"].each do |person|
    counter += 1
    person.each do |key, values|
      if key == "name" && values.downcase == character.downcase
        ret = character_hash["results"][counter]["films"]
      end
    end
  end
  ret
end

def format_film_data(character_hash, character)
  get_film_data(find_films(character_hash, character)).sort do |moviea, movieb|
    moviea["episode_id"] <=> movieb["episode_id"]
  end
end

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  puts format_film_data(character_hash, character)
  #foo = 1
  # while foo <= 9
  #   all_characters = RestClient.get("http://www.swapi.co/api/people/?page=#{foo}")
  #   character_hash = JSON.parse(all_characters)
  #   if format_film_data(character_hash, character) == nil
  #     foo += 1
  #   else
  #     foo += 1
  #     puts format_film_data(character_hash, character)
  #   end
  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end

def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
