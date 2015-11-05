require "nokogiri"
require "open-uri"

page = Nokogiri::HTML(open("http://lingvotutor.ru/1500-samyx-upotreblyaemyx-slov-k-toefl"))

word_list = []

page.search("th.column-1")[0].each do |row|
  original = row.css('th.column-1')[0].text
  translated = row.css('th.column-3')[0].text
  word_list << Hash[original, translated]
end
# word_list.each do |original, translated|
#   Card.create( original_text: original, translated_text: translated )
# end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
