require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = "https://developer.mozilla.org/en/docs/Web/Guide/HTML/HTML5/HTML5_element_list"
doc = Nokogiri::HTML(open(url))
categories = ["#Interactive_elements" , "#Forms" , "#Tabular_data" , "#Embedded_content" , "#Edits" , "#Text-level_semantics" , "#Grouping_content" , "#Sections" , "#Scripting" , "#Document_metadata" , "#Root_element"]

categories.each do |category|
	doc.css(category + "+ .standard-table td").each do |item|
		puts category
		puts item.css(":nth-child(1)").text[/\<(.*?)>/,1]
		puts item.css("+ td").text.gsub(/\s+/, " ")
	end
end