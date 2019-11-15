class InterventionController < ApplicationController
   
    before_action :set_intervention, only: [:show, :edit, :update, :destroy]
   
    def new
      @interventions = Intervention.new
    end

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
  
      typeOfBuilding = params['Type_of_building']
  
      residentialApartmentNumber = params['Residential_apartment_number']
      residentialFloorNumber = params['Residential_floor_number']
      residentialUndergroundNumber = params['Residential_underground_number']
  
      commercialFloorNumber = params['Commercial_floor_number']
      commercialStoreNumber = params['Commercial_store_number']
      commercialUndergroundNumber = params['Commercial_underground_number']
      commercialElevCageNumber = params['Commercial_elevCage_number']
      commercialParkPlaceNumber = params['Commercial_parkPlace_number']
  
      corporateCompanieNumber = params['Corporate_companie_number']
      corporateFloorNumber = params['Corporate_floor_number']
      corporateUndergroundNumber = params['Corporate_underground_number']
      corporateParkPlaceNumber = params['Corporate_parkPlace_number']
      corporateOccPerFloorNumber =params['Corporate_OccPerFloor_number']
  
      hybridStoreNumber = params['Hybrid_store_number']
      hybridFloorNumber = params['Hybrid_floor_number']
      hybridUndergroundNumber = params['Hybrid_underground_number']
      hybridParkplaceNumber = params['Hybrid_parkPlace_number']
      hybridOccPerFloorNumber = params['Hybrid_OccPerFloor_number']
      hybridHourActNumber = params['Hybrid_hourAct_number']
  
      estCageNumber = params['Est_cage_number']
      range = params['Range']
      unitPrice = params['Unit_price']
      elevatorPrice = params['Elevator_price']
      installationCost =params['Installation_cost']
      totalPrice = params['Total_price']
  
      name = params['Name']
      company = params['Company']
      email = params['Email']
      phone = params['Phone']
  
      
  
      @intervention = intervention.new(intervention_params)
      
      
      @intervention.type_of_building = typeOfBuilding
  
      if typeOfBuilding == 'residential'
        @intervention.apartments_number = residentialApartmentNumber
        @intervention.floors_number = residentialFloorNumber
        @intervention.undergrounds_number = residentialUndergroundNumber
  
        @intervention.estimate_cage_number = estCageNumber
        @intervention.range_of_elevator = range
        @intervention.unit_price = unitPrice
        @intervention.elevator_price = elevatorPrice
        @intervention.installation_cost = installationCost
        @intervention.total_price = totalPrice
        @intervention.name = name
        @intervention.company = company
        @intervention.email = email
        @intervention.phone_number = phone
  
        
        @intervention.save!
        @intervention.intervention
        redirect_to intervention_confirm_path
        
      end
  
      if typeOfBuilding == 'commercial'
        @intervention.floors_number = commercialFloorNumber
        @intervention.stores_number = commercialStoreNumber
        @intervention.undergrounds_number = commercialUndergroundNumber
        @intervention.cage_number = commercialElevCageNumber
        @intervention.parking_places = commercialParkPlaceNumber
  
        @intervention.estimate_cage_number = estCageNumber
        @intervention.range_of_elevator = range
        @intervention.unit_price = unitPrice
        @intervention.elevator_price = elevatorPrice
        @intervention.installation_cost = installationCost
        @intervention.total_price = totalPrice
        @intervention.name = name
        @intervention.company = company
        @intervention.email = email
        @intervention.phone_number = phone
  
        
        @intervention.save!
        @intervention.intervention
        redirect_to intervention_confirm_path
       
      end
  
      if typeOfBuilding == 'corporate'
        @intervention.companies_number = corporateCompanieNumber
        @intervention.floors_number = corporateFloorNumber
        @intervention.undergrounds_number = corporateUndergroundNumber
        @intervention.parking_places = corporateParkPlaceNumber
        @intervention.occupants_per_floor = corporateOccPerFloorNumber
  
        @intervention.estimate_cage_number = estCageNumber
        @intervention.range_of_elevator = range
        @intervention.unit_price = unitPrice
        @intervention.elevator_price = elevatorPrice
        @intervention.installation_cost = installationCost
        @intervention.total_price = totalPrice
        @intervention.name = name
        @intervention.company = company
        @intervention.email = email
        @intervention.phone_number = phone
  
        
        @intervention.save!
        @intervention.intervention
        redirect_to intervention_confirm_path
        
      end
  
      if typeOfBuilding == 'hybride'
        @intervention.stores_number = hybridStoreNumber
        @intervention.floors_number = hybridFloorNumber
        @intervention.undergrounds_number = hybridUndergroundNumber
        @intervention.parking_places = hybridParkplaceNumber
        @intervention.occupants_per_floor = hybridOccPerFloorNumber
        @intervention.open_hours = hybridHourActNumber
  
        @intervention.estimate_cage_number = estCageNumber
        @intervention.range_of_elevator = range
        @intervention.unit_price = unitPrice
        @intervention.elevator_price = elevatorPrice
        @intervention.installation_cost = installationCost
        @intervention.total_price = totalPrice
        @intervention.name = name
        @intervention.company = company
        @intervention.email = email
        @intervention.phone_number = phone
  
        
        @intervention.save!
        @intervention.intervention
        redirect_to intervention_confirm_path
       
      end
    
  
      if typeOfBuilding == nil
        redirect_to intervention_new_path
      end
    end
    
  
    # GET /interventions
    # GET /interventions.json
    def index
      @intervention.get_a_intervention
      @interventions = intervention.all
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