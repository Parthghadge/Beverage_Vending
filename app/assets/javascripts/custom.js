function PlaceOrder(element){
  let name = element.id;
  Rails.ajax({
    type: "POST",
    url: "/place_order?beverage_name=" + name,
    success: function(response) {
      alert(response["message"]);
      if(response["unavailable_beverages"].length > 0)
      {
        for(i=0; i<response["unavailable_beverages"].length; i++ )
        {
          element = document.getElementById(`${response["unavailable_beverages"][i]}`);
          element.classList.remove("btn-primary");
          element.classList.add("btn-danger");
          element.innerHTML = "Unavailable"
        }
      }
    },
    error: function(error){console.log(error)}
  });
}
