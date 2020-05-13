require 'watir'
require 'pp'

class Prompt < ApplicationRecord

    def self.scrape
        prompt_array = []

        browser = Watir::Browser.new
        browser.goto 'https://thinkwritten.com/365-creative-writing-prompts'

        # puts browser.title
  
        div = browser.div(:class => 'entry-content')
        div.elements.each do |e|
            if e.text[0].to_i > 0
                prompt_array << e.text
            end
        end
        browser.close
        puts prompt_array
    end 

end
