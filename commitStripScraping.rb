require 'rss'
require 'open-uri'
require 'mechanize'

# RSS Scraping info from: https://medium.com/@josheche/parsing-an-rss-feed-in-ruby-on-rails-58b23cfb5b25
# add gem that checks to see whether page has changed and performs web scraping operations upon change  
def comics_rss_scrape(xml_feed_string)
    rss_results = []
    rss = RSS::Parser.parse(open(xml_feed_string).read, false).items[0..4]

    rss.each do |result|
        result = { 
           title: result.title,
           date: result.pubDate,
           link: result.link,
           description: result.description,
           content: result.content_encoded.CDATA.p.image_src
        }
        rss_results.push(result)
    end
    return rss_results
end

# the comics() function will produce a data dump that we need to filter through 
#    to get the actual comics

# TODO: figure out how to store comic links, images, and possibly related records!!!!!!!!!!!
# file systems are preferred to databases in regards to image storage, good to use with open source compression software!

# this function can probably be applied to other websites to automate web scraping, 
#    but they MAY have different ways to hold the data
print(comics_rss_scrape('http://www.commitstrip.com/en/feed/'))

def get_comic_images(rss_results_array)
    agent = Mechanize.new
    rss_results_array.each do |result|
        agent.get(result.content).save "images/#{File.basename(url)}"
    end
end

get_comic_images(rss_results)
