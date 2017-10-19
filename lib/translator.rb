# require modules here
  require 'yaml'
  require 'pry'

def load_library(path)

  yam = YAML.load_file(path)
  return_hash = {'get_meaning' => {}, 'get_emoticon' => {}}
  yam.each do |meaning, emoticons|
    return_hash['get_meaning'][emoticons[1]] = meaning
    return_hash['get_emoticon'][emoticons[0]] = emoticons[1]
  end
  return_hash
end

def get_japanese_emoticon(path, english_emoticon)
  emos = load_library(path)
  emos['get_emoticon'].each do |e, j|
    if e == english_emoticon
      return j
    end
  end
  return "Sorry, that emoticon was not found"

end

def get_english_meaning(path, japanese_emoticon)
  emos = load_library(path)
  emos['get_meaning'].each do |emo, meaning|
    if emo == japanese_emoticon
      return meaning
    end
  end
  return "Sorry, that emoticon was not found"

end
