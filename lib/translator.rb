# require modules here

def load_library(file_path)
	require 'yaml'
	dictionary = YAML.load_file(file_path)
	new_hash = {"get_meaning" => {}, "get_emoticon" => {}}
	dictionary.each do |key, value_array|
		new_hash["get_meaning"][value_array[1]] = key
		new_hash["get_emoticon"][value_array[0]] = value_array[1]
	end
	new_hash

end


def get_japanese_emoticon(file_path, emoticon)
  lookup_hash = load_library(file_path)
  if lookup_hash["get_emoticon"].key?(emoticon)
  	return lookup_hash["get_emoticon"][emoticon]
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, jap_emoticon)
  lookup_hash = load_library(file_path)
  if lookup_hash["get_meaning"].key?(jap_emoticon)
  	return lookup_hash["get_meaning"][jap_emoticon]
  end
  return "Sorry, that emoticon was not found"
end