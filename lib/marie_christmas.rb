require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

    def get_town_name()
        town_name = []
        page_url_dept = "https://www.annuaire-des-mairies.com/val-d-oise.html"
        dept_page = Nokogiri::HTML(URI.open(page_url_dept))
        return town_name = dept_page.xpath("//a[contains(@class, 'lientxt')]/text()").map {|x| x.to_s.downcase.gsub(" ", "-") }
      end
      
      def get_email(town)
        town_email = []
        for i in 0...town.length # Boucle sur toutes les villes pour choper les emails
        page_url_town = "https://www.annuaire-des-mairies.com/95/#{town[i]}.html"
        town_page = Nokogiri::HTML(URI.open(page_url_town))
        town_email << town_page.xpath("//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]/text()").to_s
        end
        return town_email
      end
      
    email_town_result = Hash[get_town_name.zip(get_email(get_town_name))]
    emailfinal = email_town_result.map {|*kv| kv.to_h }
    puts emailfinal
