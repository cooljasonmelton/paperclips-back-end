class EntriesController < ApplicationController
    skip_before_action :authorized, only: :create


    def create
        user = User.find_by(id: params[:userId])

        selected_date = Date.parse(params[:date])
        entry = Entry.find_or_create_by(:created_at => selected_date.beginning_of_day..selected_date.end_of_day)  
        entry.assign_attributes(content: params[:content], wordcount: params[:wordCount], goal: params[:goal])
        
        user.entries << entry
        
        render json: entry

    end 


end
