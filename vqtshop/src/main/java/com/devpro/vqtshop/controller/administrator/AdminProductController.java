package com.devpro.vqtshop.controller.administrator;

import java.awt.Color;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.vqtshop.controller.BaseController;
import com.devpro.vqtshop.model.Brand;

import com.devpro.vqtshop.model.Categories;
import com.devpro.vqtshop.model.ColorProduct;
import com.devpro.vqtshop.model.Product;
import com.devpro.vqtshop.model.ProductsSize;
import com.devpro.vqtshop.services.BrandService;
import com.devpro.vqtshop.services.CategoriesService;
import com.devpro.vqtshop.services.ColorService;
import com.devpro.vqtshop.services.PagerData;
import com.devpro.vqtshop.services.ProductService;
import com.devpro.vqtshop.services.ProductsSizeService;


/**
 * Controller luôn có tiền tố Admin
 * @author daing
 *
 */
@Controller
public class AdminProductController extends BaseController {

//	@Autowired
//	private CategoriesService categoriesService;
	
	@Autowired 
	private BrandService brandService;
	
	@Autowired 
	private ColorService colorService;
	
	@Autowired 
	private ProductService productService;
	
	@Autowired
	private ProductsSizeService productsSizeService;
	/**
	 * Admin vào thêm mới sản phẩm.
	 * các request luôn có tiền tố /admin/...
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = { "/admin/product/management" }, method = RequestMethod.GET)
	public String adminProductAdd( final Model model, 
												    	final HttpServletRequest request,
														final HttpServletResponse response) 
														throws IOException {
		
		// khởi tạo 1 product (entity ) mới
		Product newProduct = new Product();
		
		// đẩy data xuống view
		model.addAttribute("product", newProduct);
		
		
		// đẩy danh sách ProductsSize xuống tầng view
		List<Brand> NewBrand =brandService.getEntitiesByNativeSQL("SELECT * FROM vqtshopdb.tbl_brand");
		
		model.addAttribute("brand", NewBrand); 
		// trả về view
		

		// đẩy danh sách ProductsSize xuống tầng view
		List<ProductsSize> NewProductsSize =productsSizeService.getEntitiesByNativeSQL("SELECT * FROM vqtshopdb.tbl_size");
		
		model.addAttribute("productsSize", NewProductsSize); 
		// trả về view
		

		// đẩy danh sách ProductsSize xuống tầng view
		List<ColorProduct> NewColor=colorService.getEntitiesByNativeSQL("SELECT * FROM vqtshopdb.tbl_color");
		
		model.addAttribute("colorProduct", NewColor); 
		// trả về view
		return "administrator/product_management";
		
	}
	/**
	 * Admin xem thông tin sản phẩm
	 * @param model
	 * @param request
	 * @param response
	 * @param productId
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = { "/admin/product/management/{productId}" }, method = RequestMethod.GET)
	public String adminProductEdit(final Model model, 
								   final HttpServletRequest request,
								   final HttpServletResponse response, 
								   @PathVariable("productId") int productId) throws IOException {

		// lấy product trong db theo ID
		Product addedProduct = productService.getById(productId);
		model.addAttribute("product", addedProduct);
		
		
		// đẩy danh sách ProductsSize xuống tầng view
		List<ProductsSize> NewProductsSize =productsSizeService.getEntitiesByNativeSQL("SELECT * FROM vqtshopdb.tbl_size");
		
		model.addAttribute("productsSize", NewProductsSize); 
		
		return "administrator/product_management";
		
	}
	
	
	/**
	 * Khi Admin click submit button để thêm mới sản phẩm
	 * các request luôn có tiền tố /admin/...
	 * @param model
	 * @param request
	 * @param response
	 * @param product
	 * @param productAvatar
	 * @param productPictures
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = { "/admin/product/management" }, method = RequestMethod.POST)
	public String adminProductAddOrUpdate(final Model model, 
										  final HttpServletRequest request,
										  final HttpServletResponse response, 
										  @ModelAttribute("product") Product product,  // hứng dư liệu modelAttribute="product"  bên form đẩy lên 
										  @RequestParam("productAvatar") MultipartFile productAvatar,  // productAvatar  = (name="productAvatar" )
										  @RequestParam("productPictures") MultipartFile[] productPictures
	) throws Exception {
	
	    
		// thêm mới
		if (product.getId() == null || product.getId() <= 0) {
			productService.add(product, productAvatar, productPictures);
		}
		// chỉnh sửa
		else
		{ 
			productService.update(product, productAvatar, productPictures);
		}
		
		// trở về trang danh sách
		return "redirect:/admin/product/list";
		
	}
	
	
}
