  require 'nokogiri'
  require 'open-uri'
  class Scraper
    def scrape_tools
      url = URI.open('https://buzzmatic.net/700-ai-tools-die-ultimative-liste/')
      doc = Nokogiri::HTML(url)

      #Extracting the rows of the table
      rows = doc.css('tr')[0..1136]

      #Extracting the name,description nd link from the data
      rows.each do |row|
        #Extracting name
        toolNameElement = row.css('td')[0]
        toolName = toolNameElement&.text&.strip

        #Extracting description
        toolDescriptionElement = row.css('td')[3]
        toolDescription = toolDescriptionElement&.text&.strip

        #Extracting link
        toolLinkElement = row.css('a').first
        toolLink = toolLinkElement['href'] if toolLinkElement

        #Extracting categories
        toolCategoryElement = row.css('td')[1]
        toolCategory = toolCategoryElement&.text&.strip

        #Extracting prices
        toolPriceElement = row.css('td')[2]
        toolPrice = toolPriceElement&.text&.strip

        #Finding a record with a given category
        category = Category.find_or_create_by(category: toolCategory)

        #Finding a record with a given price
        price = Price.find_or_create_by(price: toolPrice)

        #Finding the record by its name.
        ai_tool = AiTool.find_by(name: toolName)

        if ai_tool
          #Updating the records if found
          ai_tool.update(
            description: toolDescription,
            link: toolLink,
            category_id: category.id,
            price_id: price.id
          )
        else
          #Creating the records not found
          AiTool.create(
            name: toolName,
            description: toolDescription,
            link: toolLink,
            category_id: category.id,
            price_id: price.id
          )
        end
      end
    end
  end