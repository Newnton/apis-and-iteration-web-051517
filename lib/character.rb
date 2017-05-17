require 'rest-client'
require 'json'
require 'pry'

class Character
  def initialize(person_hash)
    @films = []
    @film_URLS = person_hash["films"]
    @name = person_hash["name"]
  end
  attr_reader :films, :name, :film_URLS
end



class Films
  def initialize(film_URLS)
    @film_URLS = film_URLS
    self.get_film_data
  end

  def get_film_data
    @film_ary = @film_URLS.map do |film_URL|
      film_data = RestClient.get(film_URL)
      film_data_hash = JSON.parse(film_data)
      "#{film_data_hash["episode_id"]} #{film_data_hash["title"]}"
    end
  end

  def format_film_data
    @film_ary.sort do |moviea, movieb|
      moviea[0] <=> movieb[0]
    end
  end
end
