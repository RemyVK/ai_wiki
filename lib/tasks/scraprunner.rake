desc 'Scrape data'

task :scrape => :environment do
  scrape = Scraper.new
  scrape.scrape_tools
end