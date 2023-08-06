  require 'nokogiri'
  require 'open-uri'
  class Scraper
    def scrape_tools
      url = URI.open('https://buzzmatic.net/700-ai-tools-die-ultimative-liste/')

      doc = Nokogiri::HTML(url)
      row = doc.css('tr#table_13_row_0')

      # Extract data from the table row
      name = row.css('td')[0].text.strip
      description = row.css('td')[3].text.strip
      link = row.css('td')[4].css('a').attr('href').value.strip

      AiTool.create(
        name: name,
        description: description,
        link: link
      )
    end
  end

scrape =Scraper.new
scrape.scrape_tools