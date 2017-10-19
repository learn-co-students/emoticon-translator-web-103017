# require modules here
require "yaml"



def load_library(path)
  # code goes here
  emoticons = YAML.load_file(path)
  keys = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }

  emoticons.each do |emotion, emoticons|
    keys["get_meaning"][emoticons[1]] = emotion
    keys["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  keys
end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  load_library(path)
  emoticons = YAML.load_file(path)
  keys = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }

  emoticons.each do |emotion, emoticons|
    keys["get_meaning"][emoticons[1]] = emotion
    keys["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  if keys["get_emoticon"].keys.include?(emoticon)
    keys["get_emoticon"][emoticon]
  elsif keys["get_emoticon"].keys.include?(emoticon) == false
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  # code goes here
  load_library(path)
  emoticons = YAML.load_file(path)
  keys = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }

  emoticons.each do |emotion, emoticons|
    keys["get_meaning"][emoticons[1]] = emotion
    keys["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  if keys["get_meaning"].keys.include?(emoticon)
    keys["get_meaning"][emoticon]
  elsif keys["get_meaning"].keys.include?(emoticon) == false
    return "Sorry, that emoticon was not found"
  end
end
