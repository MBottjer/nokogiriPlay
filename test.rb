require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = "https://developer.mozilla.org/en/docs/Web/Guide/HTML/HTML5/HTML5_element_list"
doc = Nokogiri::HTML(open(url))
categories = {"#Root_element" => 1, "#Document_metadata" => 2, "#Scripting" => 3, "#Sections" => 4, "#Grouping_content" => 5, "#Text-level_semantics" => 6, "#Edits" => 7, "#Embedded_content" => 8, "#Tabular_data" => 9, "#Forms" => 10, "#Interactive_elements" => 11}

categories.each_key do |category|
	doc.css(category + "+ .standard-table td").each do |item|
		puts categories[category]
		puts item.css(":nth-child(1)").text[/\<(.*?)>/,1]
		puts item.css("+ td").text.gsub(/\s+/, " ")
	end
end