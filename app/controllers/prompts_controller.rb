class PromptsController < ApplicationController
    skip_before_action :authorized, only: [:index]

    def index
        prompts = Prompt.all
        render json: prompts.sample, only: [:content]
    end 


end
