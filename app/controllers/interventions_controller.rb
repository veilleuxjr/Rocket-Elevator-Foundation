class InterventionsController < ApplicationController
   
  before_action :set_interventions, only: [:show, :edit, :update, :destroy]
 
  def new
    @interventions = Intervention.new
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

    

    @interventions = interventions.new(interventions_params)
    
    
    @interventions.type_of_building = typeOfBuilding

    if typeOfBuilding == 'residential'
      @interventions.apartments_number = residentialApartmentNumber
      @interventions.floors_number = residentialFloorNumber
      @interventions.undergrounds_number = residentialUndergroundNumber

      @interventions.estimate_cage_number = estCageNumber
      @interventions.range_of_elevator = range
      @interventions.unit_price = unitPrice
      @interventions.elevator_price = elevatorPrice
      @interventions.installation_cost = installationCost
      @interventions.total_price = totalPrice
      @interventions.name = name
      @interventions.company = company
      @interventions.email = email
      @interventions.phone_number = phone

      
      @interventions.save!
      @interventions.interventions
      redirect_to interventions_confirm_path
      
    end

    if typeOfBuilding == 'commercial'
      @interventions.floors_number = commercialFloorNumber
      @interventions.stores_number = commercialStoreNumber
      @interventions.undergrounds_number = commercialUndergroundNumber
      @interventions.cage_number = commercialElevCageNumber
      @interventions.parking_places = commercialParkPlaceNumber

      @interventions.estimate_cage_number = estCageNumber
      @interventions.range_of_elevator = range
      @interventions.unit_price = unitPrice
      @interventions.elevator_price = elevatorPrice
      @interventions.installation_cost = installationCost
      @interventions.total_price = totalPrice
      @interventions.name = name
      @interventions.company = company
      @interventions.email = email
      @interventions.phone_number = phone

      
      @interventions.save!
      @interventions.interventions
      redirect_to interventions_confirm_path
     
    end

    if typeOfBuilding == 'corporate'
      @interventions.companies_number = corporateCompanieNumber
      @interventions.floors_number = corporateFloorNumber
      @interventions.undergrounds_number = corporateUndergroundNumber
      @interventions.parking_places = corporateParkPlaceNumber
      @interventions.occupants_per_floor = corporateOccPerFloorNumber

      @interventions.estimate_cage_number = estCageNumber
      @interventions.range_of_elevator = range
      @interventions.unit_price = unitPrice
      @interventions.elevator_price = elevatorPrice
      @interventions.installation_cost = installationCost
      @interventions.total_price = totalPrice
      @interventions.name = name
      @interventions.company = company
      @interventions.email = email
      @interventions.phone_number = phone

      
      @interventions.save!
      @interventions.interventions
      redirect_to interventions_confirm_path
      
    end

    if typeOfBuilding == 'hybride'
      @interventions.stores_number = hybridStoreNumber
      @interventions.floors_number = hybridFloorNumber
      @interventions.undergrounds_number = hybridUndergroundNumber
      @interventions.parking_places = hybridParkplaceNumber
      @interventions.occupants_per_floor = hybridOccPerFloorNumber
      @interventions.open_hours = hybridHourActNumber

      @interventions.estimate_cage_number = estCageNumber
      @interventions.range_of_elevator = range
      @interventions.unit_price = unitPrice
      @interventions.elevator_price = elevatorPrice
      @interventions.installation_cost = installationCost
      @interventions.total_price = totalPrice
      @interventions.name = name
      @interventions.company = company
      @interventions.email = email
      @interventions.phone_number = phone

      
      @interventions.save!
      @interventions.interventions
      redirect_to interventions_confirm_path
     
    end
  

    if typeOfBuilding == nil
      redirect_to interventions_new_path
    end
  end
  

  # GET /interventionss
  # GET /interventionss.json
  def index
    @interventions.get_a_interventions
    @interventionss = interventions.all
  end

  # GET /interventionss/1
  # GET /interventionss/1.json
  def show
  end



  # GET /interventionss/1/edit
  def edit
  end

  # POST /interventionss
  # POST /interventionss.json

    respond_to do |format|
      if @interventions.save
        format.html { redirect_to @interventions, notice: 'interventions was successfully created.' }
        format.json { render :show, status: :created, location: @interventions }
      else
        format.html { render :new }
        format.json { render json: @interventions.errors, status: :unprocessable_entity }
      end
    end
  

  # PATCH/PUT /interventionss/1
  # PATCH/PUT /interventionss/1.json
  def update
    respond_to do |format|
      if @interventions.update(interventions_params)
        format.html { redirect_to @interventions, notice: 'interventions was successfully updated.' }
        format.json { render :show, status: :ok, location: @interventions }
      else
        format.html { render :edit }
        format.json { render json: @interventions.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interventionss/1
  # DELETE /interventionss/1.json
  def destroy
    @interventions.destroy
    respond_to do |format|
      format.html { redirect_to interventionss_url, notice: 'interventions was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interventions
      @interventions = interventions.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interventions_params
      params.fetch(:interventions, {})
    end 
  end