require './lib/API/zendesk.rb'
class InterventionsController < ApplicationController
   
	skip_before_action :verify_authenticity_token
  before_action :set_intervention, only: [:show, :edit, :update, :destroy]
   
    def new
      @interventions = Intervention.new
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
  
      @interventions = Intervention.new

      @interventions.author = params['author']
      @interventions.customer_id = params['intervention']['customer']
      @interventions.building_id = params['intervention']['building_id']
      @interventions.battery_id = params['intervention']['battery_id'] if params['intervention']['column_id'] == ""
      @interventions.column_id = params['intervention']['column_id'] if params['intervention']['elevator_id'] == ""
      @interventions.elevator_id = params['intervention']['elevator_id']
      @interventions.employee_id = params['intervention']['employee_id']
      @interventions.rapport = params['rapport']
    
     
    
      #   if params['intervention']['column_id'] == ""
      #   @interventions.get_interventions_battery
      # elsif params['intervention']['elevator_id'] == ""
      #   @interventions.get_interventions_column
      # else
      #   @interventions.get_interventions_elevator
     
      @interventions.save!
      get_intervention(@interventions)
      redirect_to root_path
      end

      def get_intervention(interventions)

        customer_info = interventions.customer.company_name
        building_nb = interventions.building_id
        address_number = interventions.building.address.number_and_street
        address_city = interventions.building.address.city
        battery_nb = interventions.battery_id
        column_nb = interventions.column_id
        elevator_nb = interventions.elevator_id
        employee_name = interventions.employee.first_name
        employee_lastname = interventions.employee.last_name
        report_info = interventions.rapport
    
      zendesk = Zendesk.new
      zendesk.get_an_intervention(
        customer_info, 
        building_nb, 
        address_number, 
        address_city, 
        battery_nb, 
        column_nb,
        elevator_nb,
        employee_name, 
        employee_lastname) 
    end 
  
    # GET /intervention
    # GET /intervention.json
    def index
      @interventions = intervention.all
    end
  
    # GET /intervention/1
    # GET /intervention/1.json
    def show
    end
  
  
  
    # GET /intervention/1/edit
    def edit
    end
  
    # POST /intervention
    # POST /intervention.json
  
      respond_to do |format|
        if @intervention.save
          format.html { redirect_to @intervention, notice: 'intervention was successfully created.' }
          format.json { render :show, status: :created, location: @intervention }
        else
          format.html { render :new }
          format.json { render json: @intervention.errors, status: :unprocessable_entity }
        end
      end
    
  
    # PATCH/PUT /intervention/1
    # PATCH/PUT /intervention/1.json
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
  
    # DELETE /intervention/1
    # DELETE /intervention/1.json
    def destroy
      @intervention.destroy
      respond_to do |format|
        format.html { redirect_to intervention_url, notice: 'intervention was successfully destroyed.' }
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

