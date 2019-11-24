package mapper;

import pojo.Borrow;
import pojo.Product;


import java.sql.SQLException;
import java.util.List;

public interface ProductMapper {
   Boolean RegisterProduct(Product product) throws SQLException;
   List<Product> getProductList(Product product) throws SQLException;
   boolean updateProduct(Product product) throws SQLException;
   boolean deleteProductByid(Integer id) throws SQLException;
   Product getProductByid(Integer id) throws SQLException;
   boolean borrow(Borrow borrow)throws Exception;
   boolean borrowUpdate(Product product)throws Exception;
//   boolean repay(Borrow borrow);
//   boolean repayUpdate(Product product)throws Exception;
}
