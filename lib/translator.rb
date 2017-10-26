# require modules here

def load_library(file_path)
  # code goes here

  require "yaml"
  emoticons = YAML.load_file(file_path)
  hash = {'get_meaning' => {}, 'get_emoticon' => {}}
  emoticons.each do |description, emoji|
    hash['get_meaning'][emoji[1]] = description
    hash['get_emoticon'][emoji[0]] = emoji[1]
  end
    hash


end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here

  library = load_library(file_path)
  return "Sorry, that emoticon was not found" if !library['get_emoticon'].include?(emoticon)
  return library['get_emoticon'][emoticon]
end

def get_english_meaning(file_path, emoticon)
  # code goes here

  library = load_library(file_path)
  return "Sorry, that emoticon was not found" if !library['get_meaning'][emoticon]
  return library['get_meaning'][emoticon]
end
