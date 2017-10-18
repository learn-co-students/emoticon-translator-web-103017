require "yaml"

def load_library (emoticons)
  emoticons = YAML.load_file('lib/emoticons.yml')
  output={"get_meaning"=>{},"get_emoticon"=>{}}
   emoticons.each do |meaning, emoticon|
     output["get_meaning"][emoticon[1]]=meaning
     output["get_emoticon"][emoticon[0]]=emoticon[1]
   end
  output
end

def get_japanese_emoticon(path='lib/emoticons.yml', emoticon)
  emoticons=load_library(path)
    if emoticons["get_emoticon"].include?(emoticon)
      emoticons["get_emoticon"][emoticon]
    else
   "Sorry, that emoticon was not found"
   end
end

def get_english_meaning(path='lib/emoticons.yml', emoticon)
    emoticons=load_library(path)
      if emoticons["get_meaning"].include?(emoticon)
        emoticons["get_meaning"][emoticon]
      else
     "Sorry, that emoticon was not found"
     end
end
