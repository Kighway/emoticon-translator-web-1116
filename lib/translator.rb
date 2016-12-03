require 'yaml'
require 'pry'

def load_library (path)
  contents = YAML.load_file(path)
  # binding.pry
  by_meaning_or_emoticon = {"get_meaning" => {}, "get_emoticon" => {} }
  contents.each do |meaning, emoticons|
    by_meaning_or_emoticon["get_meaning"][emoticons[1]] = meaning
    by_meaning_or_emoticon["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  by_meaning_or_emoticon
end

def get_japanese_emoticon(path, english_emoticon)
  by_meaning_or_emoticon = load_library (path)
  japanese_emoticon = by_meaning_or_emoticon["get_emoticon"][english_emoticon]
  japanese_emoticon ? japanese_emoticon : "Sorry, that emoticon was not found"
end

def get_english_meaning (path, japanese_emoticon)
  by_meaning_or_emoticon = load_library (path)
  english_emoticon = by_meaning_or_emoticon["get_meaning"][japanese_emoticon]
  english_emoticon ? english_emoticon : "Sorry, that emoticon was not found"
end
