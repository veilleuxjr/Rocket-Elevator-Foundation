class InterventionController < ApplicationController
    @intervention = intervention.new
end

def create 
    @intervention = intervention.new(params[:intervention])
    if @intervention.save
        redirect_to new_intervention_path
    end
end