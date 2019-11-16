$(function() {

    if ($("select#column").val() == "") {
     $("select#elevator option").remove();
     var row = "<option value=\"" + "" + "\">" + "elevator" + "</option>";
     $(row).appendTo("select#column");
    }
    $(".column_id").change(function() {
        console.log("column change")
     var id_value_string = $(this).val();
     console.log(id_value_string)
     if (id_value_string == "") {
      $(".elevator_id option").remove();
      var row = "<option value=\"" + "" + "\">" + "elevator" + "</option>";
      $(row).appendTo(".elevator_id");
     } else {
      // Send the request and update buildings dropdown
      $.ajax({
       dataType: "json",
       cache: false,
       url: '/get_elevator_by_column/' + id_value_string,
       timeout: 5000,
       error: function(XMLHttpRequest, errorTextStatus, error) {
        console.log("Failed to submit : " + errorTextStatus + " ;" + error);
       },
       success: function(data) {
           console.log(data)
        // Clear all options from buildings select
        $(".elevator_id option").remove();
        //put in a empty default line
        var row = "<option value=\"" + "" + "\">" + "elevator" + "</option>";
        $(row).appendTo(".elevator_id");
        // Fill buildings select
        $.each(data, function(i, j) {
         row = "<option value=\"" + j.id + "\">" + j.id + " "+ j.information + "</option>";
         $(row).appendTo(".elevator_id");
        });
       }
      });
     }
    });
 
   });