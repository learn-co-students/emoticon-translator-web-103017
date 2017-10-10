# require modules here
require "yaml"
def load_library(filepath)
  library = YAML.load_file("#{filepath}")
  hash = {"get_meaning" => {},
          "get_emoticon" => {}}
  library.each do |emotion, emoticon_array|
    hash["get_meaning"][emoticon_array[1]] = emotion
    hash["get_emoticon"][emoticon_array[0]] = emoticon_array[1]
  end
  hash
end

def get_japanese_emoticon(filepath, emoticon)
  answer = load_library(filepath)["get_emoticon"][emoticon]
  answer != nil ? answer : "Sorry, that emoticon was not found"

end

def get_english_meaning(filepath, emoticon)
  answer = load_library(filepath)["get_meaning"][emoticon]
  answer != nil ? answer : "Sorry, that emoticon was not found"
end
