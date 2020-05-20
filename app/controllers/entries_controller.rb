class EntriesController < ApplicationController
    skip_before_action :authorized, only: [:create, :index]

    def index
        render json: Entry.all
    end 


    def create
        user = User.find_by(id: params[:userId])
        selected_date = Date.parse(params[:date])
        entries = Entry.where("created_at >= ?", Time.zone.now.beginning_of_day)
        entry = entries.select{ |e| e.user_id == user.id }[0]       
        if entry 
            entry.update(content: params[:content], wordcount: params[:wordCount], goal: params[:goal])
        else 
            entry = Entry.create(user_id: user.id, content: params[:content], wordcount: params[:wordCount], goal: params[:goal]) 
        end 
        render json: entry 
    end 


end
