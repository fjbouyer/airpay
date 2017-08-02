$(document).ready(function() {
  // Going further : do functions without jquerry inside (1 jquerry request = 1 fx) and put class names in variable (refacto)

  // When add to cart button pushed
  $(".addToCart").on("click", function(e){
    console.log("Click detected on element in product list");
    var product_id = $(this).parent().parent().attr("data-productid");
    var product_name = $(this).parent().parent().find(".product-name").text();
    var product_price = $(this).parent().parent().find(".product-price").text();
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

  $('#shopping-validate').on('click', '.btn', function() {
    console.log("Check cart");
    cartSnapshot();
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
    new_product_row.append($("<td>").html("<span class=\"product-price\">" + product_price + "</span>€"));
    new_product_row.append($("<td>").html(genQuantityCell(1)));
    new_product_row.append($("<td>").html("<span class=\"product-total-price\">" + product_price + "</span>€"));
    new_product_row.append($("<td>").html("<i class=\"fa fa-trash\" aria-hidden=\"true\"></i>"));
    $("#table-product-list").append(new_product_row);
    cartSnapshot();
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
  element.find(".product-total-price").text(total_price.toFixed(2));

  cartSnapshot();
}

function genQuantityCell(quantity) {
  return "<i class=\"fa fa-plus\" aria-hidden=\"true\"></i>\
          <input type=\"number\" class=\"product-quantity\" value=\"" + quantity + "\">\
          <i class=\"fa fa-minus\" aria-hidden=\"true\"></i>";
}

function deleteProductRow(product_id) {
  element = $("#table-product-list").find("[data-productid='" + product_id + "']").remove();
  cartSnapshot();
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
    element.find(".product-total-price").text(total_price.toFixed(2));
  }

  cartSnapshot();
}

function cartSnapshot() {
  // On va recuperer et faire un hash de notre panier
  var rows = $("#table-product-list tr");

  if(rows.length == 0) {
    console.log("nothing in here");
  }
  else {
    var cart_snapshot = {};
    cart_snapshot['items'] = [];
    cart_snapshot['resa'] = {};
    cart_snapshot['total_price'] = 0;
    var current_total_price = 0;

    $.each (rows, function(k, v){
      var item = {};
      var resa = {};
      var data_resid = $(v).attr("data-reservationid");

      if (typeof data_resid !== typeof undefined && data_resid !== false) {
        resa['reservation_id'] = $(v).attr("data-reservationid");
        resa['reservation_quantity'] = $(v).find(".reservation-person-number").text();
        resa['reservation_total_price'] = $(v).find(".reservation-total-price").text();
        current_total_price += parseInt(resa['reservation_total_price']);
        cart_snapshot['resa'] = resa;
      }
      else {
        item['product_id'] = $(v).attr("data-productid");
        item['product_quantity'] = $(v).find(".product-quantity").val();
        item['product_price'] = $(v).find(".product-price").text();
        current_total_price += ( item['product_quantity'] * item['product_price'] );
        cart_snapshot['items'].push(item);
      }
    });

    cart_snapshot['total_price'] = current_total_price;
    updateTotalPrice(current_total_price);
    console.log(JSON.stringify(cart_snapshot));
    $("#order_cart_snapshot").val(JSON.stringify(cart_snapshot));
  }

}

function updateTotalPrice(total_price){
  $("#total-price").text(total_price);
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
