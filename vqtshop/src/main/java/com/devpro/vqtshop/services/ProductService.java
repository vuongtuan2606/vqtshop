package com.devpro.vqtshop.services;

import java.io.File;
import java.io.IOException;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

//import com.devpro.vqtshop.dto.ProductSearchModel;
import com.devpro.vqtshop.model.Product;
import com.devpro.vqtshop.model.ProductImages;
import com.github.slugify.Slugify;

@Service
public class ProductService extends BaseService<Product> {

	@Autowired
	private ProductImagesService productImagesService;
	
	@Override
	protected Class<Product> clazz() {
		return Product.class;
	}
	
	/**
	 * dùng để kiểm tra xem admin có upload ảnh product hay không
	 * @param images
	 * @return
	 */
	private boolean isEmptyUploadFile(MultipartFile[] images) {
		if (images == null || images.length <= 0)
			return true;

		if (images.length == 1 && images[0].getOriginalFilename().isEmpty())
			return true;

		return false;
	}

	/**
	 * dùng để kiểm tra xem admin có upload ảnh product hay không
	 * @param image
	 * @return
	 */
	private boolean isEmptyUploadFile(MultipartFile image) {
		return image == null || image.getOriginalFilename().isEmpty();
	}
	// khi admin update cùng tên với nhau để tránh lưu bị trùng nhau + thêm currentTimeMillis thời gian update
	private String getUniqueUploadFileName(String fileName) {
		String[] splitFileName = fileName.split("\\.");
		return splitFileName[0] + System.currentTimeMillis() + "." + splitFileName[1];
	}
	
	/**
	 * Chú ý: trong các hàm ở tầng Service dùng để thêm mới hoặc xóa hoặc chỉnh sửa cần thêm @Transactional.
	 * Thêm mới sản phẩm.
	 * @param p
	 * @param productAvatar
	 * @param productPictures
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	
	
	@Transactional // khi thực hiện lưu trữ 2 bảng với nhau , nếu 1 cái được 1 cái lỗi thì @Transactional lưu cùng thành công , cùng thất bại -> cái thành công sẽ không đượcn lưu trong db
	public Product add(Product p, MultipartFile productAvatar, MultipartFile[] productPictures) // tham số hứng được bên controller
			throws IllegalStateException, IOException {

		// kiểm tra xem admin có đẩy avatar lên không ???
		if (!isEmptyUploadFile(productAvatar)) { // có đẩy avatar lên.
			
			// Lấy fileName của ảnh update
			String fileName = getUniqueUploadFileName(productAvatar.getOriginalFilename());
			
			// tạo đường dẫn tới folder chứa avatar
			String pathToAvatar = "C:/upload/product/avatar/" + fileName;

			// lưu avatar vào đường dẫn trên
			productAvatar.transferTo(new File(pathToAvatar)); 

			// lưu đường dẫn tương đối tới avatar
			p.setAvatar("product/avatar/" + fileName);
		}

		// có đẩy pictures(product_images) ???
		if (!isEmptyUploadFile(productPictures)) { // có đẩy pictures lên.

			// nếu admin đẩy lên thì duyệt tất cả file đẩy lên và lưu trên server
			for (MultipartFile pic : productPictures) {
				String fileName = getUniqueUploadFileName(pic.getOriginalFilename());
				
				// lưu ảnh admin đẩy lên vào server
				pic.transferTo(new File("C:/upload/product/pictures/" + fileName));

				// tạo mới 1 bản ghi product_images
				ProductImages pi = new ProductImages();
				// setPath cột trong bảng ProductImages
				pi.setPath("product/pictures/" + fileName); 
				// setTitle cột trong bảng ProductImages
				pi.setTitle(fileName); 
				// hàm tạo ra khi tạo quan hệ one to many đã định nghĩa
				p.addProductImages(pi); 
			}
		}

		// tạo seo: bổ sung thêm thời gian tính bằng miliseconds để tránh trùng seo
		//p.setSeo(new Slugify().slugify(p.getTitle() + "-" + System.currentTimeMillis()));
		
		// lưu vào database
		return super.saveOrUpdate(p);
		
	}
	
	@Transactional
	public Product update(Product p, MultipartFile productAvatar, MultipartFile[] productPictures)
			throws IllegalStateException, IOException {

		// lấy thông tin cũ của product theo id
		Product productInDb = super.getById(p.getId());

		// có đẩy avartar ??? => xóa avatar cũ đi và thêm avatar mới
		if (!isEmptyUploadFile(productAvatar)) {
			// xóa avatar trong folder lên
			new File("C:/upload/" + productInDb.getAvatar()).delete();

			// sử dụng avatar mới
			String fileName = getUniqueUploadFileName(productAvatar.getOriginalFilename());
			productAvatar.transferTo(new File("C:/upload/product/avatar/" + fileName));
			p.setAvatar("product/avatar/" + fileName);
		} 
		
		else {
			// sử dụng lại avartar cũ
			p.setAvatar(productInDb.getAvatar());
		}

		// có đẩy pictures ???
		if (!isEmptyUploadFile(productPictures)) {

			// xóa pictures cũ
			if (productInDb.getProductImages() != null && productInDb.getProductImages().size() > 0) {
				for (ProductImages opi : productInDb.getProductImages()) {
					// xóa avatar trong folder lên
					new File("C:/upload/" + opi.getPath()).delete();

					// xóa dữ liệu trong database
					productImagesService.delete(opi);
				}
			}

			// thêm pictures mới
			for (MultipartFile pic : productPictures) {
				String fileName = getUniqueUploadFileName(pic.getOriginalFilename());
				
				pic.transferTo(new File("C:/upload/product/pictures/" + fileName));
				
				ProductImages pi = new ProductImages();
				pi.setPath("product/pictures/" + fileName);
				pi.setTitle(fileName);
				
				p.addProductImages(pi);
			}
		}

		//tạo seo
		//p.setSeo(new Slugify().slugify(p.getTitle() + "-" + System.currentTimeMillis()));
		
		// lưu vào database
		return super.saveOrUpdate(p);
	}
	
//	public PagerData<Product> search(ProductSearchModel searchModel) {
//
//		// khởi tạo câu lệnh
//		String sql = "SELECT * FROM tbl_products p WHERE 1=1";
//
//		if (searchModel != null) {
//			
//			// tìm kiếm theo category
//			if(searchModel.getCategoryId() != null && searchModel.getCategoryId() > 0) {
//				sql += " and category_id = " + searchModel.getCategoryId();
//			}
//		
//			// tìm theo seo
////			if (!StringUtils.isEmpty(searchModel.seo)) {
////				sql += " and p.seo = '" + searchModel.seo + "'";
////			}
//
//			// tìm kiếm sản phẩm hot
////			if (searchModel.isHot != null) {
////				sql += " and p.is_hot = '" + searchModel.seo + "'";
////			}
//			
//			// tìm kiếm theo title và description
//			if (!StringUtils.isEmpty(searchModel.getKeyword())) {
//				sql += " and (p.title like '%" + searchModel.getKeyword() + "%'" + 
//						     " or p.detail_description like '%" + searchModel.getKeyword() + "%'" + 
//						     " or p.short_description like '%" + searchModel.getKeyword() + "%')";
//			}
//		}
//
//		// chi lay san pham chua xoa
////				sql += " and p.status=1 ";
//		
//		return getEntitiesByNativeSQL(sql, searchModel.getPage());
//		
//	}
}
