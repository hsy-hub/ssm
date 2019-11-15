package mapper;

import pojo.Product;


import java.sql.SQLException;
import java.util.List;

public interface ProductMapper {
    public Boolean RegisterProduct(Product product) throws SQLException;
    public List<Product> getProductList(Product product) throws SQLException;
    public boolean updateProduct(Product product) throws SQLException;
    public boolean deleteProductByid(Integer id) throws SQLException;
    public Product getProductByid(Integer id) throws SQLException;
    public boolean borrow(Product product)throws Exception;
    public boolean borrowUpdate(Integer id)throws Exception;
}
