require "yaml"

def load_library(path)
  library = YAML.load_file(path)
  dictionary = {"get_meaning" => {}, "get_emoticon" => {}}
 
  library.each do |definition, emoticon_arr|
    dictionary["get_meaning"][emoticon_arr[1]] = definition
  end

  library.each do |definition, emoticon_arr|
    dictionary["get_emoticon"][emoticon_arr[0]] = emoticon_arr[1]
  end
  dictionary
end

def get_japanese_emoticon(path, emoticon)
  result = (load_library(path))["get_emoticon"][emoticon]

  if result == nil
    return "Sorry, that emoticon was not found"
  end
  result
end

def get_english_meaning(path, emoticon)
  result = load_library(path)["get_meaning"][emoticon]
if result == nil
  return "Sorry, that emoticon was not found"
 end
 result
end








