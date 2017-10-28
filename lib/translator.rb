require "yaml"

def load_library(filepath)
  newhash = YAML.load_file(filepath)
  returnstuff = {
    "get_emoticon" => {},
    "get_meaning" => {}
  }
  newhash.each do |key, value|
    returnstuff["get_meaning"][value[1]] = key
    returnstuff["get_emoticon"][value[0]] = newhash[key][1]
  end
  return returnstuff
end

def get_japanese_emoticon(filepath, emoticon)
  newhash = load_library(filepath)
  if newhash["get_emoticon"][emoticon] == nil
    return "Sorry, that emoticon was not found"
  else
    return newhash["get_emoticon"][emoticon]
  end
end

def get_english_meaning(filepath, emoticon)
  newhash = load_library(filepath)
  if newhash["get_meaning"][emoticon] == nil
    return "Sorry, that emoticon was not found"
  else
    return newhash["get_meaning"][emoticon]
  end
end
