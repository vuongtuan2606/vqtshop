package com.devpro.vqtshop.controller.customer;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.vqtshop.controller.BaseController;
import com.devpro.vqtshop.dto.Cart;
import com.devpro.vqtshop.dto.CartItem;
import com.devpro.vqtshop.model.Product;
import com.devpro.vqtshop.model.SaleOrder;
import com.devpro.vqtshop.model.SaleOrderProducts;
import com.devpro.vqtshop.services.ProductService;
import com.devpro.vqtshop.services.SaleOrderService;


@Controller
public class CartController extends BaseController {

	@Autowired
	private ProductService productService;
	
	@Autowired
	private SaleOrderService saleOrderService;
	
	@RequestMapping(value = { "/cart" }, method = RequestMethod.GET)
	public String cartCheckout(final Model model, 
											   final HttpServletRequest request, 
											   final HttpServletResponse response) throws IOException {
		return "customer/cart_success"; // -> đường dẫn tới View.
	}
	@RequestMapping(value = { "/payorder" }, method = RequestMethod.GET)
	public String payorder(final Model model, 
					   				    final HttpServletRequest request, 
					   				    final HttpServletResponse response)
	   						     		throws IOException{
  
		// đường dẫn tới file view
		return "customer/payorder"; // -> /WEB-INF/views/customer/index.jsp
    }
	
	@RequestMapping(value = { "/cart/checkout" }, method = RequestMethod.POST)
	public String cartFinished(final Model model, 
											  final HttpServletRequest request, 
											  final HttpServletResponse response) throws IOException {
		
		// Lấy thông tin khách hàng
		String customerFullName = request.getParameter("customerFullName");
		String customerEmail = request.getParameter("customerEmail");
		String customerPhone = request.getParameter("customerPhone");
		String customerAddress = request.getParameter("customerAddress");

		// tạo hóa đơn + với thông tin khách hàng lấy được
		SaleOrder saleOrder = new SaleOrder();
		saleOrder.setOrderStatus(1);
		saleOrder.setCustomerName(customerFullName);
		saleOrder.setCustomerEmail(customerEmail);
		saleOrder.setCustomerAddress(customerAddress);
		saleOrder.setCustomerPhone(customerPhone);	
		saleOrder.setCode(String.valueOf(System.currentTimeMillis())); // tạo mã hóa đơn bằng cách sử dụng thời gian hiện tại.
		
		/*
		 * if(isLogined()) { getUserLogined().addSaleOrder(saleOrder); }
		 */
		
	
		// lấy giỏ hàng
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		//tổng giá trị đơn hàng
		saleOrder.setTotal(cart.getTotalPrice());
		
		// lấy sản phẩm trong giỏ hàng
		for (CartItem cartItem : cart.getCartItems()) {
			SaleOrderProducts saleOrderProducts = new SaleOrderProducts();
			saleOrderProducts.setProduct(productService.getById(cartItem.getProductId()));
			saleOrderProducts.setQuantity(cartItem.getQuanlity());

			// sử dụng hàm tiện ích add hoặc remove đới với các quan hệ onetomany
			saleOrder.addSaleOrderProducts(saleOrderProducts);
		}
		
		// lưu vào database
		saleOrderService.saveOrUpdate(saleOrder);
		
     	// thực hiện reset lại giỏ hàng của Session hiện tại
		session.setAttribute("cart", null);
		session.setAttribute("totalItems", 0);
		
	return "customer/cart_successz"; // -> đường dẫn tới View.
		
	}
	
	@RequestMapping(value = { "/giohang/cart_success" }, method = RequestMethod.GET)
	public String cartsuccess(final Model model, 
										   final HttpServletRequest request, 
										   final HttpServletResponse response) throws IOException {
		return  "customer/cart_successz"; // -> đường dẫn tới View.
	}
	

	/**
	 * Thêm 1 sản phẩm vào trong giỏ hàng khi click nút "Add To Cart"
	 */
	@RequestMapping(value = { "/ajax/addToCart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_AddToCart(final Model model,
														      final HttpServletRequest request,
														      final HttpServletResponse response, 
														      final @RequestBody CartItem cartItem) {

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng. Đầu tiên giả sử giỏ hàng là null(chưa có giỏ hàng)
		Cart cart = null;
		
		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
		if (session.getAttribute("cart") != null) { // tồn tại 1 giỏ hàng trên session
			cart = (Cart) session.getAttribute("cart");
		} 
		else {// chưa có giỏ hàng nào trên session
			cart = new Cart(); //khởi tạo giỏ hàng mới
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm đang có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		// kiểm tra nếu sản phẩm muốn bổ sùng vào giỏ hàng có trong giỏ hàng nếu có thì tăng số lượng
		boolean isExists = false;
		for (CartItem item : cartItems) {
			if (item.getProductId() == cartItem.getProductId()) {
				isExists = true;
				// tăng số lượng sản phẩm lên
				item.setQuanlity(item.getQuanlity() + cartItem.getQuanlity());
			}
		}

		// nếu sản phẩm chưa có trong giỏ hàng thì thực hiện add sản phẩm đó vào giỏ hàng
		if (!isExists) {
			// trước khi thêm mới thì lấy sản phẩm trong db
			// và thiết lập tên + đơn giá cho cartitem
			Product productInDb = productService.getById(cartItem.getProductId());

			cartItem.setProductName(productInDb.getTitle());
			cartItem.setPriceUnit(productInDb.getPrice());
			cartItem.setAnhSP(productInDb.getAvatar());
			cart.getCartItems().add(cartItem); // thêm mới sản phẩm vào giỏ hàng
		}

		// tính tổng tiền
	this.calculateTotalPrice(request);
		
		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		
		// lưu totalItems vào session
		// tất cả các giá trị lưu trên session đều có thể truy cập được từ View
		session.setAttribute("totalItems", getTotalItems(request));
		
		return ResponseEntity.ok(jsonResult);
	}
	

	
	/**
	 * Tổng số lượng sản phẩm trong giỏ hàng
	 */
	private int getTotalItems(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("cart") == null) {
			return 0;
		}

		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		int total = 0;
		for (CartItem item : cartItems) {
			total += item.getQuanlity();
		}

		return total;
	}
	

	@RequestMapping(value = { "/ajax/updateQuanlityCart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_UpdateQuanlityCart(final Model model, 
																													   final HttpServletRequest request,
																													   final HttpServletResponse response, 
																													   final @RequestBody CartItem cartItem) {

		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Cart cart = null;
		
		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		}
		else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		// kiểm tra nếu có trong giỏ hàng thì tăng số lượng
		BigDecimal total = null;
		int currentProductQuality = 0;
		
		for (CartItem item : cartItems) {
			if (item.getProductId() == cartItem.getProductId()) 
			{
				currentProductQuality = item.getQuanlity() + cartItem.getQuanlity();
				item.setQuanlity(currentProductQuality);
				//total = item.getPriceUnit().multiply(BigDecimal.valueOf(currentProductQuality));
			}
		}

		// tính tổng tiền
		this.calculateTotalPrice(request);
		cart.setTotalPrice(this.calculateTotalPrice(request));
		
		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		jsonResult.put("currentProductQuality", currentProductQuality);
		//jsonResult.put("total", total);
		jsonResult.put("totalPrice", formatCurrency(calculateTotalPrice(request)));
		
		session.setAttribute("totalItems", getTotalItems(request));
		return ResponseEntity.ok(jsonResult);
	}
	
	
	 private String formatCurrency(BigDecimal value) 
	 { 
		 Locale loc = new Locale("vi", "VN"); 
		 NumberFormat nf = NumberFormat.getCurrencyInstance(loc);
		 return nf.format(value); 
		 
	 }
	 
	
	


	
	/**
	 * Tính tổng tiền của giỏ hàng
	 */
	private BigDecimal calculateTotalPrice(final HttpServletRequest request) {

	
		HttpSession session = request.getSession();

		Cart cart = null;
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();
		BigDecimal total = BigDecimal.ZERO;
		
		for(CartItem ci : cartItems) 
		{
			total = total.add(ci.getPriceUnit().multiply(BigDecimal.valueOf(ci.getQuanlity())));
		}

		cart.setTotalPrice(total);
		
		return total;
	}
	
	
	@RequestMapping(value = { "/cart/deleteProduct" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteProductCart(final Model model, 
															final HttpServletRequest request,
															final HttpServletResponse response, 
															final @RequestBody CartItem cartItem) {
		
		
		HttpSession session = request.getSession();

		Cart cart = (Cart) session.getAttribute("cart");
		
		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();
		int index = 0;
		for (CartItem ci : cartItems) 
		{
			if(cartItem.getProductId()==ci.getProductId()) {
				break;
			}
			index++;
		}

		cartItems.remove(index);
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Đã xóa thành công");
		return ResponseEntity.ok(jsonResult);
		
	}
	
	
}
