# require modules here
require 'yaml'
require 'pry'

def load_library(path)
  emoticons = YAML.load_file("#{path}")
  hash = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  emoticons.each do |emotion, emoticon|
    hash["get_meaning"][emoticon[1]] = emotion
    hash["get_emoticon"][emoticon[0]] = emoticon[1]
  end
  hash
end

def get_japanese_emoticon(path, emoticon)
  japanese_equiv = load_library(path)["get_emoticon"][emoticon]
  if japanese_equiv == nil
    return "Sorry, that emoticon was not found"
  else
    japanese_equiv
  end
end

def get_english_meaning(path, emoticon)
  english_equiv = load_library(path)["get_meaning"][emoticon]
  if english_equiv == nil
    return "Sorry, that emoticon was not found"
  else
    english_equiv
  end
end
