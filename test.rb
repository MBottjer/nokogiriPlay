require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = "https://developer.mozilla.org/en/docs/Web/Guide/HTML/HTML5/HTML5_element_list"
doc = Nokogiri::HTML(open(url))
doc.css("#wikiArticle td").each do |item|
	puts item.css(":nth-child(1)").text[/\<(.*?)>/,1]
	puts item.css("+ td").text.gsub(/\s+/, " ")
end