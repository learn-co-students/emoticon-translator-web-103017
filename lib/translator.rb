require 'yaml'
require 'pry'

yaml_path = '/Users/erica/Development/Labs/emoticon-translator-web-103017/lib/emoticons.yml'


def load_library(yaml_path)
    yaml_hash = YAML.load_file(yaml_path)
    emoticon_library = {}
    emoticon_library["get_meaning"] = {}
    emoticon_library["get_emoticon"] = {}
    yaml_hash.each do |emotion, array|
        array.each_with_index do |item, index|
            emoticon_library["get_meaning"][array[1]] = emotion
            emoticon_library["get_emoticon"][array[0]] = array[1]
        end
    end
    emoticon_library
end

def get_japanese_emoticon(yaml_path, emoticon)
    emoticon_library = load_library(yaml_path)
    emoticon_library.each do |type, hash|
        if type == "get_emoticon"
            hash.each do |key, value|
                if emoticon == key
                    return value
                end
            end
        end
    end
    return "Sorry, that emoticon was not found"
end

def get_english_meaning(yaml_path, emoticon)
    emoticon_library = load_library(yaml_path)
    emoticon_library.each do |type, hash|
        if type == "get_meaning"
            hash.each do |key, value|
                if emoticon == key
                    return value
                end
            end
        end
    end
    return "Sorry, that emoticon was not found"
end

