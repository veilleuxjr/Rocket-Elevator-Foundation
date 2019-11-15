$(function() {

    if ($("select#customer").val() == "") {
     $("select#buildings option").remove();
     var row = "<option value=\"" + "" + "\">" + "buildings" + "</option>";
     $(row).appendTo("select#buildings");
    }
    console.log(row)
    $(".customer_id").change(function() {
        console.log("customer change")
     var id_value_string = $(this).val();
     console.log(id_value_string)
     if (id_value_string == "") {
      $(".building_id option").remove();
      var row = "<option value=\"" + "" + "\">" + "buildings" + "</option>";
      $(row).appendTo(".building_id");
     } else {
      // Send the request and update buildings dropdown
      $.ajax({
       dataType: "json",
       cache: false,
       url: '/get_buildings_by_customer/' + id_value_string,
       timeout: 5000,
       error: function(XMLHttpRequest, errorTextStatus, error) {
        console.log("Failed to submit : " + errorTextStatus + " ;" + error);
       },
       success: function(data) {
           console.log(data)
        // Clear all options from buildings select
        $(".building_id option").remove();
        //put in a empty default line
        var row = "<option value=\"" + "" + "\">" + "buildings" + "</option>";
        $(row).appendTo(".building_id");
        // Fill buildings select
        $.each(data, function(i, j) {
         row = "<option value=\"" + j.id + "\">" + j.admin_full_name + "</option>";
         $(row).appendTo(".building_id");
        });
       }
      });
     }
    });
 
   });