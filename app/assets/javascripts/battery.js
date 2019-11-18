$(function() {

    if ($("select#buildings").val() == "") {
     $("select#battery option").remove();
     var row = "<option value=\"" + "" + "\">" + "battery" + "</option>";
     $(row).appendTo("select#buildings");
    }
    $(".building_id").change(function() {
        console.log("building change")
     var id_value_string = $(this).val();
     $("#batteries_select").hide();
     $("#columns_select").hide();
     $("#elevators_select").hide();
     console.log(id_value_string)
     if (id_value_string == "") {
      $(".battery_id option").remove();
      var row = "<option value=\"" + "" + "\">" + "battery" + "</option>";
      $(row).appendTo(".battery_id");
     } else {
      // Send the request and update buildings dropdown
      $.ajax({
       dataType: "json",
       cache: false,
       url: '/get_battery_by_buildings/' + id_value_string,
       timeout: 5000,
       error: function(XMLHttpRequest, errorTextStatus, error) {
        console.log("Failed to submit : " + errorTextStatus + " ;" + error);
       },
       success: function(data) {
           console.log(data)
        // Clear all options from buildings select
        $(".battery_id option").remove();
        //put in a empty default line
        var row = "<option value=\"" + "" + "\">" + "Select Battery" + "</option>";
        $(row).appendTo(".battery_id");
        // Fill buildings select
        $.each(data, function(i, j) {
         row = "<option value=\"" + j.id + "\">"+ "Battery #" + j.id + "</option>";
         $(row).appendTo(".battery_id");
        });
       }
      });
     } $("#batteries_select").show();
    });
 
   });