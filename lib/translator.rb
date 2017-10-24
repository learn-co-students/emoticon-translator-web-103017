# require modules here
require 'yaml'


def load_library(yaml_path)
  yaml_hash = YAML.load_file(yaml_path)
  emoticon_library = {"get_meaning" => {}, "get_emoticon" => {}}
  yaml_hash.each do |key, value|
    value.each do |emoticon|
      emoticon_library["get_meaning"][emoticon] = key
      emoticon_library["get_emoticon"][value[0]] = value[1]
    end
  end
  emoticon_library

end


def get_japanese_emoticon(yaml_path, emoticon)
  # code goes here
  emoticon_library = load_library(yaml_path)
  if emoticon_library["get_emoticon"].include?(emoticon)
    return emoticon_library["get_emoticon"][emoticon]
  end

   return "Sorry, that emoticon was not found"
end

def get_english_meaning(yaml_path, emoticon)
  # code goes here
  emoticon_library = load_library(yaml_path)
  if emoticon_library["get_meaning"].include?(emoticon)
    return emoticon_library["get_meaning"][emoticon]
  end

   return "Sorry, that emoticon was not found"
end
