class Post < ApplicationRecord

  class CraigScraper
    attr_accessor :parse_page

    def initialize(url)
      page = HTTParty.get(url)

      # Instance varilable will be used in this class
      @parse_page ||= Nokogiri::HTML(page)
    end

    def get_title
      parse_page.css(".hdrlnk").children.map { |title| title.text }
    end

    def get_price
      parse_page.css(".result-meta").map { |e|
        # Use regex to find a match that starts with doller sign and follows numbers
        # use a to_s method in a MatchData object to convert to string
        e.first_element_child.inner_html.match(/\$[\d,]+/).to_s
      }
    end

    def get_date
      parse_page.css(".result-date").children.map { |price| price.text }
    end

  end

  listings = 0
  9.times do |i|
    craig_scraper = CraigScraper.new('https://raleigh.craigslist.org/search/apa?s=' + (i * 120).to_s)
    title_array = craig_scraper.get_title
    price_array = craig_scraper.get_price
    date_array = craig_scraper.get_date

    (0...date_array.size).each do |index|
      if listings < 1000
        # puts"--- index: #{index + 1} ---"
        # puts "Name: #{title_array[index]} || price: #{price_array[index]} || date: #{date_array[index]} "
        p = Post.new
        p.title = title_array[index]
        if price_array[index]
          p.price = price_array[index].gsub(/\D/,'').to_i
        end
        p.date = date_array[index]
        listings += 1
        p.save!
      end
    end
  end


end
