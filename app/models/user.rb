class User < ApplicationRecord
    has_many :entries, dependent: :destroy
    has_secure_password
    validates :email, uniqueness: true


    def fill_missing_entries 

        start = self.entries.first.created_at 
        end_date = DateTime.now
        start_day = DateTime.new(start.year, start.month, start.day)
        end_day = DateTime.new(end_date.year, end_date.month, end_date.day)
   
        allDates = []
        while start_day != end_day do 
            allDates << start_day
            start_day = start_day.next_day(1)
        end

        allDates.each do |date|
            get_entry = self.entries.select do |e|
                entry_day = DateTime.new(e.created_at.year, e.created_at.month, e.created_at.day)
                date == entry_day              
            end
            if !get_entry[0]
                Entry.create(content: "", wordcount: 0, goal: self.current_goal, user_id: self.id, created_at: date.next_day)
            end
        end 

     


        

          
    
    end 


end
