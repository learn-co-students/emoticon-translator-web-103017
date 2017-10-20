# require modules here
require "pry"
require "yaml"


def load_library(path)
  new_hash = {}
  library = YAML.load_file(path)

  new_hash = {"get_meaning" => {}, "get_emoticon" => {}}

  library.each do |name, data|#"angel", data
      new_hash["get_meaning"][data[1]] = name
      new_hash["get_emoticon"][data[0]] = data[1]
  end
  new_hash
end


def get_japanese_emoticon(path, emoticon)
  new_hash = load_library(path)

  j_emoticon = new_hash["get_emoticon"][emoticon]

  new_hash["get_emoticon"].include?(emoticon) ? j_emoticon : "Sorry, that emoticon was not found"
end


def get_english_meaning(path, emoticon)
  new_hash = load_library(path)

  e_meaning = new_hash["get_meaning"][emoticon]

  new_hash["get_meaning"].include?(emoticon) ? e_meaning : "Sorry, that emoticon was not found"
end
