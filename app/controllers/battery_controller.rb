class BatteryController < ApplicationController

    def get_battery_by_buildings
      @battery = Battery.where("buildings_id = ?", params[:buildings_id])
      puts @battery
      respond_to do |format|
        format.json { render :json => @battery }
      end
    end 
    def battery_search
      if params[:location].present? && params[:buildings].strip != ""
        @battery = Battery.where("buildings_id = ?", params[:buildings])
      else
        @battery = Battery.all
      end
    end
  
  end