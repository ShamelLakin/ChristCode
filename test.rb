require "nokogiri"
require "open-uri"
require 'pry'

def scrape_verse_items(keyword)
    
    pg = 1
    
    while pg < 1000
        puts "page #{pg}"
          url = "https://www.bible.com/search/bible?page=#{pg}&q=#{keyword}&version_id=1"
          
          doc = Nokogiri::HTML(open(url))
          items = doc.css("ul.search-result li.reference")
          error = doc.css('div#noresults')
          
            until error do
                if keyword != '' 
                    item_hash = {}
                    items.each do |item|
                         title = item.css("h3").text.strip
                         content = item.css("p").text.strip
                         item_hash[title] = content
                         
                    end
                else
                    puts "Please enter a valid search"
                end 
                
                if error 
                    break
                end
            end
          pg += 1
        end
     item_hash
end

puts scrape_verse_items('joy')
binding.pry

