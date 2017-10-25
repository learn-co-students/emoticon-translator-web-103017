
require "yaml"

def load_library(file_path)
  emoticons_hash = Hash.new(0)
  emoticons = YAML.load_file(file_path)
  emoticons_hash['get_emoticon'] = Hash.new(0)
  emoticons_hash['get_meaning'] = Hash.new(0)

  emoticons.each do |description, symbol|
    emoticons_hash['get_emoticon'][symbol[0]] = symbol[1]
    emoticons_hash['get_meaning'][symbol[1]] = description
  end
  emoticons_hash
end

def get_japanese_emoticon(file_path, emoticons)
  translator = load_library(file_path)
  sorry_message = "Sorry, that emoticon was not found"
  if translator['get_emoticon'].include?(emoticons)
    translator['get_emoticon'][emoticons]
  else
    sorry_message
  end
end
def get_english_meaning(file_path, emoticons)
  translator = load_library(file_path)
  sorry_message = "Sorry, that emoticon was not found"
  if translator['get_meaning'].include?(emoticons)
    translator['get_meaning'][emoticons]
  else
    sorry_message
  end
end
