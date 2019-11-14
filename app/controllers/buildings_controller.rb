class BuildingsController < ApplicationController

    def get_buildings_by_customer
      @buildings = Buildings.where("customer_id = ?", params[:customer_id])
      puts @buildings
      respond_to do |format|
        format.json { render :json => @buildings }
      end
    end 
    def building_search
      if params[:location].present? && params[:customer].strip != ""
        @buildings = Buildings.where("customer_id = ?", params[:customer])
      else
        @buildings = Buildings.all
      end
    end
  
  end