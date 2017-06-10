$(document).ready(function(){
  
  function updateCropSelect(farm_select, model) {
    var farm_id = $(farm_select).val();
    $.ajax({url: "/farms/" + farm_id + "/crops/select_box?model=" + model, success: function(result){
      $("#crop_select").html(result);
    }});
  }
  
  $(".container .date-picker input").datepicker({
     autoclose: true,
     format: "yyyy-mm-dd"
  });
  
  $("#transaction_farm_id").change(function(){
    updateCropSelect(this, 'transaction');
  });
  
  $("#expense_farm_id").change(function(){
    updateCropSelect(this, 'expense');
  });
  
  $("#investment_farm_id").change(function(){
    updateCropSelect(this, 'investment');
  });
  
  $("#revenue_farm_id").change(function(){
    updateCropSelect(this, 'revenue');
  });
});