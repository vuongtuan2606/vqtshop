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
