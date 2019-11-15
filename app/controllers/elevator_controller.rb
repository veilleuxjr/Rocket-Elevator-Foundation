class ElevatorController < ApplicationControllerà
    def get_elevator_by_column
        puts params[:column_id]
          @elevator = Elevator.find(params[:column_id])
          puts @elevator
          respond_to do |format|
            format.json { render :json => @elevator }
          end
        end 
        def elevator_search
          if params[:location].present? && params[:column].strip != ""
            @elevator = Elevator.where("column_id = ?", params[:column])
          else
            @elevator = Elevator.all
          end
       
end
