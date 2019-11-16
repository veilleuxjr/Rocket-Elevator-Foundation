
// elevator cage calcul
function comcalcCageNumber(){
    console.log("OK")
    var cageNumber = $("#comElevCageNumber").val();
    $("#estimateCageNumber").val(cageNumber);  
}

function rescalcCageNumber(){
    var resFloorNumber = parseFloat($("#resFloorNumber").val());
    var apartmentNumber = parseFloat($("#apartmentNumber").val());
    var apPerFloor = apartmentNumber/resFloorNumber;
    var cage = Math.ceil(apPerFloor/6);
    var cageNumber;
    if(resFloorNumber < 20){
        cageNumber = cage;
    }
    else{
        var cageNumber = Math.ceil(cage*(resFloorNumber/20));
    }
    $("#estimateCageNumber").val(cageNumber);
}

function corcalcCageNumber(){
    var corOccPerFloorNumber = parseFloat($("#corOccPerFloorNumber").val());
                    var corFloorNumber = parseFloat($("#corFloorNumber").val());
                    var corUndergrNumber = parseFloat($("#corUndergrNumber").val());
                    var totalOccup = corOccPerFloorNumber*(corFloorNumber + corUndergrNumber);
                    var elevNeeded = Math.ceil(totalOccup/1000);
                    var elevCol = Math.ceil((corFloorNumber + corUndergrNumber)/20);
                    var corCagePerCol= Math.ceil(elevNeeded/elevCol);
                    var cageNumber = corCagePerCol * elevCol;
                    $("#estimateCageNumber").val(cageNumber);
}

function hybcalcCageNumber(){
            var hybOccPerFloorNumber = parseFloat($("#hybOccPerFloorNumber").val());
            var hybFloorNumber = parseFloat($("#hybFloorNumber").val());
            var hybUndergrNumber = parseFloat($("#hybUndergrNumber").val());
            var totalOccup = hybOccPerFloorNumber * (hybFloorNumber + hybUndergrNumber);
            var elevNeeded = Math.ceil(totalOccup/1000);
            var elevCol = Math.ceil((hybFloorNumber + hybUndergrNumber)/20);
            var corCagePerCol= Math.ceil(elevNeeded/elevCol);
            var cageNumber = corCagePerCol * elevCol;
            $("#estimateCageNumber").val(cageNumber);
}



    // fonction to display nothing
    function cageNumberDisplNull(){
        $("#estimateCageNumber").val("");
    }
    // end of fonction to display nothing
    
    
    
    
    function calcCageNumber(X){
        var X = $("#buildingType").val();
        if(X == "commercial"){
            if(parseFloat($("#comElevCageNumber").val()) > 0){
                comcalcCageNumber();
            }
            else{
                cageNumberDisplNull();
            }
        }

        if(X == "residential"){ 
            if(parseFloat($("#apartmentNumber").val()) > 0 && parseFloat($("#resFloorNumber").val()) > 0){
                rescalcCageNumber();
            }
            else{
                cageNumberDisplNull();
            }       
            
        }

        if(X == "corporate"){
            if(parseFloat($("#corFloorNumber").val()) > 0 
               && parseFloat($("#corUndergrNumber").val()) >= 0
               && parseFloat($("#corOccPerFloorNumber").val()) > 0){
                corcalcCageNumber();
            }
            else{
                cageNumberDisplNull();
            }     
            
        } 

        if(X == "hybride"){
            if(parseFloat($("#hybFloorNumber").val()) > 0 
               && parseFloat($("#hybUndergrNumber").val()) >= 0
               && parseFloat($("#hybOccPerFloorNumber").val()) > 0){
                hybcalcCageNumber();
            }
            else{
                cageNumberDisplNull();
            } 
        }       
    }
// end of elevator cage calcul


            // display by type
            function showHide(){
                var type = $("#buildingType").val();
                if(type == "residential"){
                    $("#res1").show();
                    $("#com1").hide();
                    $("#corp1").hide();
                    $("#hyb1").hide();    
                }             
                else if(type == "commercial"){
                    $("#res1").hide();
                    $("#com1").show();
                    $("#corp1").hide();
                    $("#hyb1").hide();   
                }
                else if(type == "corporate"){
                    $("#res1").hide();
                    $("#com1").hide();
                    $("#corp1").show();
                    $("#hyb1").hide();    
                }
                else if(type == "hybride"){
                    $("#res1").hide();
                    $("#com1").hide();
                    $("#corp1").hide();
                    $("#hyb1").show();    
                }
                else{
                    $("#res1").hide();
                    $("#com1").hide();
                    $("#corp1").hide();
                    $("#hyb1").hide();
                }
        
            }
            // end of display by type

// to make hours of activity between 1 and 24
function correctHour(){
    var hoursOfActivity = $("#hoursOfActivity").val();
    if(hoursOfActivity < 1){
        $("#hoursOfActivity").val("");
    }
    if(hoursOfActivity > 24){
        $("#hoursOfActivity").val("24");
    }
}
// end of to make hours of activity between 1 and 24



// quote calcul
function quoteCalc(Y){
    $("#unitP").text("$" + Y[0] + ".00");
    var cageNumber = $("#estimateCageNumber").val();
    var elevP = cageNumber * Y[0];
    $("#elevP").text("$" + elevP + ".00");

    var instP = elevP *(Y[1]/100);
    $("#instP").text("$" + (instP.toFixed(2)));

    var totalP = elevP + instP;
    $("#totalP").text("$" + (totalP.toFixed(2)));

}



function quoteMake(){
    var stdArray = [7565, 10];
    var prmArray = [12345, 13];
    var excArray = [15400, 16];
    if(document.getElementById("stdRange").checked == true){
        quoteCalc(stdArray);
    }
    if(document.getElementById("prmRange").checked == true){
        quoteCalc(prmArray);
    }
    if(document.getElementById("excRange").checked == true){
        quoteCalc(excArray);
    }
}
// end of quote calcul


// Print button
function printQuote(){
    var restorePage = document.body.innerHTML;
    var printContent = document.getElementById("toPrintQuote").innerHTML;
    if(document.getElementById("stdRange").checked == true 
        || document.getElementById("prmRange").checked == true 
        || document.getElementById("excRange").checked == true){
        var cageNumber = $("#estimateCageNumber").val();
        if(cageNumber > 0){
            document.body.innerHTML = printContent;
            window.print();
            document.body.innerHTML = restorePage;
        }    
    }
}
// End of print button