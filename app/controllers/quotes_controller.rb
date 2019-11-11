class QuotesController < ApplicationController  

  before_action :set_quote, only: [:show, :edit, :update, :destroy]
 
  def new
    @quote = Quote.new
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

    

    @quote = Quote.new(quote_params)
    
    
    @quote.type_of_building = typeOfBuilding

    if typeOfBuilding == 'residential'
      @quote.apartments_number = residentialApartmentNumber
      @quote.floors_number = residentialFloorNumber
      @quote.undergrounds_number = residentialUndergroundNumber

      @quote.estimate_cage_number = estCageNumber
      @quote.range_of_elevator = range
      @quote.unit_price = unitPrice
      @quote.elevator_price = elevatorPrice
      @quote.installation_cost = installationCost
      @quote.total_price = totalPrice
      @quote.name = name
      @quote.company = company
      @quote.email = email
      @quote.phone_number = phone

      
      @quote.save!
      @quote.quote
      redirect_to quote_confirm_path
      
    end

    if typeOfBuilding == 'commercial'
      @quote.floors_number = commercialFloorNumber
      @quote.stores_number = commercialStoreNumber
      @quote.undergrounds_number = commercialUndergroundNumber
      @quote.cage_number = commercialElevCageNumber
      @quote.parking_places = commercialParkPlaceNumber

      @quote.estimate_cage_number = estCageNumber
      @quote.range_of_elevator = range
      @quote.unit_price = unitPrice
      @quote.elevator_price = elevatorPrice
      @quote.installation_cost = installationCost
      @quote.total_price = totalPrice
      @quote.name = name
      @quote.company = company
      @quote.email = email
      @quote.phone_number = phone

      
      @quote.save!
      @quote.quote
      redirect_to quote_confirm_path
     
    end

    if typeOfBuilding == 'corporate'
      @quote.companies_number = corporateCompanieNumber
      @quote.floors_number = corporateFloorNumber
      @quote.undergrounds_number = corporateUndergroundNumber
      @quote.parking_places = corporateParkPlaceNumber
      @quote.occupants_per_floor = corporateOccPerFloorNumber

      @quote.estimate_cage_number = estCageNumber
      @quote.range_of_elevator = range
      @quote.unit_price = unitPrice
      @quote.elevator_price = elevatorPrice
      @quote.installation_cost = installationCost
      @quote.total_price = totalPrice
      @quote.name = name
      @quote.company = company
      @quote.email = email
      @quote.phone_number = phone

      
      @quote.save!
      @quote.quote
      redirect_to quote_confirm_path
      
    end

    if typeOfBuilding == 'hybride'
      @quote.stores_number = hybridStoreNumber
      @quote.floors_number = hybridFloorNumber
      @quote.undergrounds_number = hybridUndergroundNumber
      @quote.parking_places = hybridParkplaceNumber
      @quote.occupants_per_floor = hybridOccPerFloorNumber
      @quote.open_hours = hybridHourActNumber

      @quote.estimate_cage_number = estCageNumber
      @quote.range_of_elevator = range
      @quote.unit_price = unitPrice
      @quote.elevator_price = elevatorPrice
      @quote.installation_cost = installationCost
      @quote.total_price = totalPrice
      @quote.name = name
      @quote.company = company
      @quote.email = email
      @quote.phone_number = phone

      
      @quote.save!
      @quote.quote
      redirect_to quote_confirm_path
     
    end
  

    if typeOfBuilding == nil
      redirect_to quote_new_path
    end
  end
  

  # GET /quotes
  # GET /quotes.json
  def index
    @quote.get_a_quote
    @quotes = Quote.all
  end

  # GET /quotes/1
  # GET /quotes/1.json
  def show
  end



  # GET /quotes/1/edit
  def edit
  end

  # POST /quotes
  # POST /quotes.json

    respond_to do |format|
      if @quote.save
        format.html { redirect_to @quote, notice: 'Quote was successfully created.' }
        format.json { render :show, status: :created, location: @quote }
      else
        format.html { render :new }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  

  # PATCH/PUT /quotes/1
  # PATCH/PUT /quotes/1.json
  def update
    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to @quote, notice: 'Quote was successfully updated.' }
        format.json { render :show, status: :ok, location: @quote }
      else
        format.html { render :edit }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.json
  def destroy
    @quote.destroy
    respond_to do |format|
      format.html { redirect_to quotes_url, notice: 'Quote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quote_params
      params.fetch(:quote, {})
    end 
  end