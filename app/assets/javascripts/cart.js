$(document).ready(function() {
  // Going further : do functions without jquerry inside (1 jquerry request = 1 fx) and put class names in variable (refacto)

  // When add to cart button pushed
  $(".addToCart").on("click", function(e){
    console.log("Click detected on element in product list");
    var product_id = $(this).parent().attr("data-productid");
    var product_name = $(this).parent().find(".product-name").text();
    var product_price = $(this).parent().find(".product-price").text();
    addProductToTable(product_id, product_name, product_price);
  });

  // Adding event on + for quantity update
  $('#table-product-list').on('click', '.fa-plus', function(){
    console.log("Click detected on fa-icon in product table");
    product_id = $(this).parent().parent().attr("data-productid");
    changeQuantity(product_id, "plus");
  });

  // Adding event on - for quantity update
  $('#table-product-list').on('click', '.fa-minus', function(){
    console.log("Click detected on fa-icon in product table");
    product_id = $(this).parent().parent().attr("data-productid");
    changeQuantity(product_id, "minus");
  });

  // Adding event on x for delete article
  $('#table-product-list').on('click', '.fa-trash', function(){
    console.log("Click detected on fa-icon in product table");
    product_id = $(this).parent().parent().attr("data-productid");
    deleteProductRow(product_id);
  });

  // Adding event on input fields
  $('#table-product-list').on('change', '.product-quantity', function() {
    console.log("Changed quantity through input");
    product_id = $(this).parent().parent().attr("data-productid");
    updateQuantity(product_id);
  });
});

function addProductToTable(product_id, product_name, product_price) {
  // If already in chart, update quantity, else, add new row
  if (isAlreadyInTable(product_id)) {
    changeQuantity(product_id, "plus");
  }
  // Else creating a new product row
  else {
    var new_product_row = $("<tr>").attr("data-productid", product_id);
    new_product_row.append($("<td>").text(product_name));
    new_product_row.append($("<td>").html("<span class=\"product-price\">" + product_price + "</span>"));
    new_product_row.append($("<td>").html(genQuantityCell(1)));
    new_product_row.append($("<td>").html("<span class=\"product-total-price\">" + product_price + "</span>"));
    new_product_row.append($("<td>").html("<i class=\"fa fa-trash\" aria-hidden=\"true\"></i>"));
    $("#table-product-list").append(new_product_row);
  }
}

function isAlreadyInTable(product_id) {
  result = $("#table-product-list").find("[data-productid='" + product_id + "']").length;
  if(result == 0) {
    return false;
  } else {
    return true;
  }
}

function changeQuantity(product_id, action) {
  element = $("#table-product-list").find("[data-productid='" + product_id + "']");
  price = element.find(".product-price").text();
  quantity = element.find(".product-quantity").val();
  quantity_temp = quantity

    if(action == "plus") {
      if((quantity_temp += 1) <= 0) {
        deleteProductRow(product_id);
      }
      else {
        quantity++;
      }
    }
    else if (action == "minus") {
      if((quantity_temp -= 1) <= 0) {
        deleteProductRow(product_id);
      }
      else {
        quantity--;
      }
    }

  total_price = price*quantity;

  // element.find(".product-quantity").parent().html(genQuantityCell(quantity));
  element.find(".product-quantity").val(quantity);
  element.find(".product-total-price").text(total_price);
}

function genQuantityCell(quantity) {
  return "<i class=\"fa fa-plus\" aria-hidden=\"true\"></i>\
          <input type=\"number\" class=\"product-quantity\" value=\"" + quantity + "\">\
          <i class=\"fa fa-minus\" aria-hidden=\"true\"></i>";
}

function deleteProductRow(product_id) {
  element = $("#table-product-list").find("[data-productid='" + product_id + "']").remove();
}

function updateQuantity(product_id) {
  element = $("#table-product-list").find("[data-productid='" + product_id + "']");
  price = element.find(".product-price").text();
  quantity = element.find(".product-quantity").val();

  if(quantity <= 0) {
    deleteProductRow(product_id);
  }
  else {
    total_price = price*quantity;
    element.find(".product-quantity").val(quantity);
    element.find(".product-total-price").text(total_price);
  }
}

// Tab logic

$(function(){

  $(".cat").on("click", function(e){
    if($(this).attr("class") == "cat cat-active"){
      $(".cat").removeClass("cat-active");
      $(".cat-content").addClass("hidden");
    }
    else if($(this).attr("class") == "cat"){
      $(".cat").removeClass("cat-active");
      $(this).toggleClass("cat-active");
      $(".cat-content").addClass("hidden");
      $($(this).data("target")).removeClass("hidden");
    }
  });

});
