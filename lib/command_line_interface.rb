def welcome
  puts "
                    8888888888  888    88888
                   88     88   88 88   88  88
                    8888  88  88   88  88888
                       88 88 888888888 88   88
                88888888  88 88     88 88    888888

                88  88  88   888    88888    888888
                88  88  88  88 88   88  88  88
                88 8888 88 88   88  88888    8888
                 888  888 888888888 88   88     88
                  88  88  88     88 88    8888888
 "
end

def get_character_from_user
  puts "please enter a character"
  gets.chomp
  # use gets to capture the user's input. This method should return that input, downcased.
end

def check_for_character(ui)
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  character_hash["results"].each do |person|
    person.each do |key, values|
      if key == "name"
        return person
      end
    end
  end
end
