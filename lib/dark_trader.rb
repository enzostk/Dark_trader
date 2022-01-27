require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'
      
    #def symbol_scrap
        page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
        symbolS = []
        page.xpath('//td[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--hide-sm cmc-table__cell--sort-by__symbol"]').each do |symbol| 
        symbolS << symbol.text
        end 
      #return symbolS
    #end
     
    #def price_scrap
        page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
        priceS = []
        page.xpath('//td [@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"]').each do |price|  
        priceS << price.text   
        end
      #return priceS
     #end 
    
    #def hashing
        crypto = Hash[symbolS.zip priceS].to_a
        crypto2 = crypto.map {|*kv| kv.to_h }
        puts crypto2
    #end
    
    #def perform
      #symbolS = symbol_scrap
      #priceS = price_scrap
      #hashing
    #end
  
#perform