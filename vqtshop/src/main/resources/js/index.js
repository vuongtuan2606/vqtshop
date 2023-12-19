
// Thêm sản phẩm vào trong giỏ hàng với productId và số lượng mua sản phẩm đó
function AddToCart(baseUrl, productId, quanlity) {
	// javascript object.  data la du lieu ma day len action cua controller
	let data = {
		productId: productId, // Id sản phẩm
		quanlity: quanlity, // Số lượng cho vào giỏ hàng
	};

	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/addToCart", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
			//alert(jsonResult.totalItems)
			
			// tăng số lượng sản phẩm trong giỏ hàng trong icon			
			$("#iconShowTotalItemsInCart").html(jsonResult.totalItems); 

			/*$([document.documentElement, document.body]).animate({
				scrollTop: $("#iconShowTotalItemsInCart").offset().top
			}, 2000);*/
		},
		error: function(jqXhr, textStatus, errorMessage) {
			
		}
	});
}



// Cập nhật số lượng sản phẩm trong giỏ hàng khi click vào button '+' hoặc '-'
//quanlity  = -1 là click vào button -
//quanlity  = +1 là click vào button +
function UpdateQuanlityCart(baseUrl, productId, quanlity) {
	
	let data = {
		productId: productId, // lay theo id	
		quanlity: quanlity
	};
	
	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/updateQuanlityCart", 
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", 
		success: function(jsonResult) {
			// tăng số lượng sản phẩm trong giỏ hàng trong icon
			$( "#quanlity_" + productId ).html(jsonResult.currentProductQuality);
			$( ".totalPrice" ).html(jsonResult.totalPrice);  // tổng tất cả sản phẩm
			$( "#totalPriceItem_" + productId).html(jsonResult.total); // tổng số từng sản phẩm
		},
		error: function(jqXhr, textStatus, errorMessage) {
			
		}
	});
}



function formatPrice(total){
    return total.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");

}


document.addEventListener("DOMContentLoaded", function() {
    var modal = document.getElementById("myModal"+i);
	modal.style.display = "block";
});



 function toggleModal(count) {
        var modal = document.getElementById("myModal" + count);
       modal.style.display = "block";
}
 function CloseModal(count) {
        var modal = document.getElementById("myModal" + count);
        modal.style.display = "none";
}


// Lấy tất cả các product link
const productLinks = document.querySelectorAll('.bag__product__link');
        
// Lặp qua từng product link
productLinks.forEach(productLink => {
  // Gắn sự kiện click cho mỗi product link
  productLink.addEventListener('click', () => {
    // Lấy data-product của product link được click
    const productId = productLink.getAttribute('data-product');
    
    // Ẩn tất cả các product item
    const productItems = document.querySelectorAll('.bag__product__item');
    productItems.forEach(productItem => {
      productItem.style.display = 'none';
    });
    
    // Hiển thị product item tương ứng với product link được click
    const selectedProduct = document.getElementById(productId);
    selectedProduct.style.display = 'block';
  });
});

const product__link = document.querySelectorAll('.bag__product__link');

product__link.forEach(link => {
  link.addEventListener('click', function() {
    product__link.forEach(link => {
      link.classList.remove('active');
    });
    this.classList.add('active');
  });
});


function displayDefaultProduct() {
  const productItems = document.querySelectorAll('.bag__product__item');
  productItems.forEach(productItem => {
    productItem.style.display = 'none';
  });

  const defaultProduct = document.querySelector('#product-1');
  defaultProduct.style.display = 'block';
}
displayDefaultProduct();


     



function accordion__products__click () {
  const accordionItems = document.querySelectorAll('.accordion__products');

  accordionItems.forEach(item => {
      const liElements = item.querySelectorAll('li');

      liElements.forEach(li => {
          li.addEventListener('click', () => {
              // Loại bỏ lớp active từ tất cả các phần tử li khác
              liElements.forEach(otherLi => {
                  otherLi.classList.remove('active');
              });

              // Thêm lớp active vào phần tử li mà bạn đã kích vào
              li.classList.add('active');
          });
      });
  });
}

function handleWatchElementClick(element) {
  // Xóa class "default" và thêm class "default" vào phần tử được kích hoạt
  const defaultElement = document.querySelector('.watch-element.action');
  defaultElement.classList.remove('action');
  element.classList.add('action');

  // Xóa nội dung của options-title
  const optionsTitle = document.querySelector('.options-title');
  optionsTitle.innerHTML = '';

  // Thêm nội dung mới vào options-title
  const newValue = element.getAttribute('data-value');
  const newTitle = document.createTextNode(`SIZE: ${newValue}`);
  optionsTitle.appendChild(newTitle);
}




function openTab(evt, tabName) {
  // Lấy tất cả các tab content và ẩn chúng
  var tabcontent = document.getElementsByClassName("tabcontent");
  for (var i = 0; i < tabcontent.length; i++) {
      tabcontent[i].style.display = "none";
  }

  // Lấy tất cả các tab buttons và loại bỏ lớp active
  var tablinks = document.getElementsByClassName("tablinks");
  for (var i = 0; i < tablinks.length; i++) {
      tablinks[i].classList.remove("active");
  }

  // Hiển thị tab content được chọn và thêm lớp active cho tab button
  document.getElementById(tabName).style.display = "block";
  evt.currentTarget.classList.add("active");
}

// Mặc định, hiển thị tab đầu tiên
document.querySelector(".tablinks").click();
