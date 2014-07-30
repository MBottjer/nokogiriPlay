require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = "https://developer.mozilla.org/en/docs/Web/Guide/HTML/HTML5/HTML5_element_list"
doc = Nokogiri::HTML(open(url))
categories = {"#Root_element" => 1, "#Document_metadata" => 2, "#Scripting" => 3, "#Sections" => 4, "#Grouping_content" => 5, "#Text-level_semantics" => 6, "#Edits" => 7, "#Embedded_content" => 8, "#Tabular_data" => 9, "#Forms" => 10, "#Interactive_elements" => 11}

# categories.each_key do |category|
# 	doc.css(category + "+ .standard-table td").each do |item|
# 		puts categories[category]
# 		puts item.css(":nth-child(1)").text[/\<(.*?)>/,1]
# 		puts item.css("+ td").text.gsub(/\s+/, " ")
# 		if item.css("img").to_s.include? "img"
# 			puts true
# 		end
			
# 	end
# end

block_url = "https://developer.mozilla.org/en-US/docs/Web/HTML/Block-level_elements"
block_doc = Nokogiri::HTML(open(block_url))

# block_doc.css(".threecolumns").each do |item|
# 	puts item.css("code").text[/\<(.*?)>/,1]
# end

puts block_doc.css(".threecolumns code").text.to_s.include? "audio"