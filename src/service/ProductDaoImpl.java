package service;

import mapper.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.Product;
import java.sql.SQLException;
import java.util.List;
@Service
public class ProductDaoImpl implements ProductDao {

    @Autowired
    ProductMapper productMapper;

    @Override
    public Boolean RegisterProduct(Product product) throws SQLException {
        return productMapper.RegisterProduct(product);
    }

    @Override
    public List<Product> getProductList(Product product) throws SQLException {
        return productMapper.getProductList(product);
    }


    @Override
    public boolean updateProduct(Product product) throws SQLException {
        return productMapper.updateProduct(product);
    }

    @Override
    public boolean deleteProductByid(Integer id) throws SQLException {
        return productMapper.deleteProductByid(id);
    }

    @Override
    public Product getProductByid(Integer id) throws SQLException {
        return productMapper.getProductByid(id);
    }



    @Override
    public boolean borrow(Product product) throws Exception {
        return productMapper.borrow(product);
    }

    @Override
    public boolean borrowUpdate(Integer id) throws Exception {
        return productMapper.borrowUpdate(id);
    }
}


