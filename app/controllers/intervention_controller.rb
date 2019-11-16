class InterventionController < ApplicationController
  skip_before_action :verify_authenticity_token
    before_action :set_interventions, only: [:show, :edit, :update, :destroy]
   
    def new
      @intervention = Intervention.new
    end

    def get_elevator_by_column
      puts params[:column_id]
        @elevator = Elevator.where("column_id = ?", params[:column_id])
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
    def get_column_by_battery
      @column = Column.where("battery_id = ?", params[:battery_id])
      puts @column
      respond_to do |format|
        format.json { render :json => @column }
      end
    end 
    def column_search
      if params[:location].present? && params[:battery_id].strip != ""
        @column = Column.where("battery_id = ?", params[:battery_id])
      else
        @column = Column.all
      end
    end

    def get_battery_by_buildings
      @battery = Battery.where(building_id: params[:buildings_id])
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

    def get_buildings_by_customer
      puts params[:customer_id]
      @buildings = Building.where(customer_id: params[:customer_id])
      puts @buildings.count
      respond_to do |format|
        format.json { render :json => @buildings }
      end
    end 
    def building_search
      if params[:location].present? && params[:customer].strip != ""
        @buildings = Building.where("customer_id = ?", params[:customer])
      else
        @buildings = Building.all
      end
    end
  
    def create
  
      @intervention = Intervention.new

      @intervention.author = params['author']
      @intervention.customer_id = params['intervention']['customer']
      @intervention.building_id = params['intervention']['building_id']
      @intervention.battery_id = params['intervention']['battery_id'] if params['intervention']['column_id'] == ""
      @intervention.column_id = params['intervention']['column_id'] if params['intervention']['elevator_id'] == ""
      @intervention.elevator_id = params['intervention']['elevator_id']
      @intervention.employee_id = params['intervention']['employee_id']
      @intervention.report = params['report_intervention']
    
      @intervention.save!
      
        if params['intervention']['column_id'] == ""
        @intervention.get_interventions_battery
      elsif params['intervention']['elevator_id'] == ""
        @intervention.get_interventions_column
      else 
        @intervention.get_interventions_elevator
      end
    
        redirect_to root_path
    
      end
  
    # GET /interventions
    # GET /interventions.json
    def index
      @intervention.get_a_intervention
      @intervention = intervention.all
    end
  
    # GET /interventions/1
    # GET /interventions/1.json
    def show
    end
  
  
  
    # GET /interventions/1/edit
    def edit
    end
  
    # POST /interventions
    # POST /interventions.json
  
      respond_to do |format|
        if @intervention.save
          format.html { redirect_to @intervention, notice: 'intervention was successfully created.' }
          format.json { render :show, status: :created, location: @intervention }
        else
          format.html { render :new }
          format.json { render json: @intervention.errors, status: :unprocessable_entity }
        end
      end
    
  
    # PATCH/PUT /interventions/1
    # PATCH/PUT /interventions/1.json
    def update
      respond_to do |format|
        if @intervention.update(intervention_params)
          format.html { redirect_to @intervention, notice: 'intervention was successfully updated.' }
          format.json { render :show, status: :ok, location: @intervention }
        else
          format.html { render :edit }
          format.json { render json: @intervention.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /interventions/1
    # DELETE /interventions/1.json
    def destroy
      @intervention.destroy
      respond_to do |format|
        format.html { redirect_to interventions_url, notice: 'intervention was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_intervention
        @intervention = intervention.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def intervention_params
        params.fetch(:intervention, {})
      end 
    end