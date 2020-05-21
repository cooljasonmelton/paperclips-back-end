require 'watir'

class Prompt < ApplicationRecord

    def self.scrape_365_creative_writing_prompts
        prompt_array = []

        browser = Watir::Browser.new
        browser.goto 'https://thinkwritten.com/365-creative-writing-prompts'

        # puts browser.title
  
        div = browser.div(:class => 'entry-content')
        div.elements.each do |e|
            if e.text[0].to_i > 0
                prompt_array << e.text.split(' ')[1..-1].join(' ')
            end
        end
        browser.close
        prompt_array[0..-2].each do |p|
            Prompt.create(content: p)
        end 
    end 

    def self.scrape_50_creative_nonfiction_prompts
        prompt_array = []

        browser = Watir::Browser.new
        browser.goto 'https://thejohnfox.com/2016/06/creative-nonfiction-prompts/'

        # puts browser.title
  
        div = browser.div(class: ['post-content', 'the-content'])
        div.elements.each do |e|
            if e.text[0].to_i > 0 && e.text != "750words"
                prompt_array << e.text.split(' ')[1..-1].join(' ')
            end
        end
        browser.close
        prompt_array.uniq.each do |p|
            Prompt.create(content: p)
        end 
    end 

    def self.scrape_wattpad_1200_prompts_first_page
        prompt_array = []

        browser = Watir::Browser.new
        browser.goto 'https://www.wattpad.com/47524188-1200-creative-writing-prompts-creative-nonfiction'

        # puts browser.title
  
        div = browser.div(class: ['page'])
        div.elements.each do |e|
            if e.text[0].to_i > 0 && e.text
                prompt_array << e.text.split(' ')[1..-1].join(' ')
            end
        end
        browser.close
        prompt_array.uniq.each do |p|
            Prompt.create(content: p)
        end 
    end 




end
