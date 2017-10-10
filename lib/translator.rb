# require modules here
require "yaml"

def load_library(path)
  # code goes here
  yaml_original = YAML.load_file(path)
  output = {"get_meaning" => {}, "get_emoticon" => {}}
  yaml_original.each do |key,value|
    output["get_meaning"][value[1]] = key
    output["get_emoticon"][value[0]] = value[1]
  end
  output
end
puts load_library('/Users/priyamsarma/Development/flatiron_learnco_labs/emoticon-translator-web-103017/lib/emoticons.yml')

def get_japanese_emoticon(path,english_emoticon)
  # code goes here
  emoticons = load_library(path)
  output = emoticons["get_emoticon"].select{|key,value| key == english_emoticon}.values[0]
  output == nil ? "Sorry, that emoticon was not found" : output
end

def get_english_meaning(path,japanese_emoticon)
  # code goes here
  emoticons = load_library(path)
  output = emoticons["get_meaning"].select{|key,value| key == japanese_emoticon}.values[0]
  output == nil ? "Sorry, that emoticon was not found" : output
end
