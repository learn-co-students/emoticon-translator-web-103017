# require modules here
require "pry"
require "yaml"

def load_library(path)
  # code goes here
  library = YAML.load_file("#{path}")
  emoticons = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  library.each do |name, emoji_array|
    japanese_emoji = emoji_array[1]
    english_emoji = emoji_array[0]
    #binding.pry
    emoticons["get_meaning"]["#{emoji_array[1]}"] = "#{name}"
    emoticons["get_emoticon"]["#{emoji_array[0]}"] = "#{emoji_array[1]}"
    #binding.pry
  end
  #binding.pry
  return emoticons
end

def get_japanese_emoticon(yaml, emoji)
  # code goes here
  emoticons = load_library(yaml)
  if emoticons["get_emoticon"].include?(emoji)
    emoticons["get_emoticon"][emoji]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(yaml, emoji)
  emoticons = load_library(yaml)
  if emoticons["get_meaning"].include?(emoji)
    emoticons["get_meaning"][emoji]
  else
    return "Sorry, that emoticon was not found"
  end
end
