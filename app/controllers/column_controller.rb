class ColumnController < ApplicationController
    def get_column_by_battery
      puts params[:battery_id]
        @column = Column.find(params[:battery_id])
        puts @column
        respond_to do |format|
          format.json { render :json => @column }
        end
      end 
      def column_search
        if params[:location].present? && params[:battery].strip != ""
          @column = Column.where("battery_id = ?", params[:battery])
        else
          @column = Column.all
        end
      end
end
