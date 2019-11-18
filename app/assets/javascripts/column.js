$(function() {

    if ($("select#battery").val() == "") {
     $("select#column option").remove();
     var row = "<option value=\"" + "" + "\">" + "column" + "</option>";
     $(row).appendTo("select#battery");
    }
    $(".battery_id").change(function() {
        console.log("battery change")
     var id_value_string = $(this).val();
     $("#columns_select").hide();
     $("#elevators_select").hide();
     console.log(id_value_string)
     if (id_value_string == "") {
      $(".column_id option").remove();
      var row = "<option value=\"" + "" + "\">" + "column" + "</option>";
      $(row).appendTo(".column_id");
     } else {
      // Send the request and update buildings dropdown
      $.ajax({
       dataType: "json",
       cache: false,
       url: '/get_column_by_battery/' + id_value_string,
       timeout: 5000,
       error: function(XMLHttpRequest, errorTextStatus, error) {
        console.log("Failed to submit : " + errorTextStatus + " ;" + error);
       },
       success: function(data) {
           console.log(data)
        // Clear all options from buildings select
        $(".column_id option").remove();
        //put in a empty default line
        var row = "<option value=\"" + "" + "\">" + "None Chosen" + "</option>";
        $(row).appendTo(".column_id");
        // Fill buildings select
        $.each(data, function(i, j) {
         row = "<option value=\"" + j.id + "\">" + "Column #" + j.id + "</option>";
         $(row).appendTo(".column_id");
        });
       }
      });
     } $("#columns_select").show();
    });
 
   });