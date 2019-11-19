package controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import pojo.Borrow;
import pojo.Product;
import service.ProductDao;

import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;
import java.util.List;

@Controller
public class ProductController {
    @Autowired
    ProductDao productDao;
    @Autowired
    HttpServletRequest request;

    //点击“图书管理”or"查询"后
    @RequestMapping("/billList.action")
    public ModelAndView productList(Product product, @RequestParam(required = false, defaultValue = "1", value = "page") int page) throws SQLException {
        ModelAndView mad = new ModelAndView();
        //首先是设置第几页，第二个参数是每页的记录数
        PageHelper.startPage(page, 5);
        List<Product> productList = productDao.getProductList(product);
        PageInfo pageinfo = new PageInfo(productList);
        mad.addObject("productName", product.getProductName());
        mad.addObject("productUnit", product.getProductUnit());
        //mad.addObject("payed",product.getPayed());
        //mad.addObject("list",productList);
        mad.addObject("pageinfo", pageinfo);
        mad.setViewName("billList");
        return mad;
    }

    //添加图书 点击"保存"后
    @RequestMapping("/RegisterProduct.action")
    public ModelAndView RegisterProduct(Product product, @RequestParam(required = false, defaultValue = "1", value = "page") int page) throws SQLException {
        ModelAndView mad = new ModelAndView();
        PageHelper.startPage(page, 5);
        List<Product> productList = productDao.getProductList(null);
        PageInfo pageinfo = new PageInfo(productList);
        boolean register = productDao.RegisterProduct(product);//用Register进行判断
        if (register) {//注册成功
            mad.addObject("pageinfo", pageinfo);
            mad.setViewName("redirect:billList.action");
        } else {//注册失败
            mad.setViewName("billAdd");
        }
        return mad;
    }

    //点击书名后
    @RequestMapping("/selectBillViewByid.action")
    public String selectBillViewByid(Integer id, Model model) throws SQLException {
        Product product = productDao.getProductByid(id);
        if (product != null) {
            model.addAttribute("product", product);
            return "billView";
        } else {
            return "billList";
        }

    }

    //进入billView页面 点击“修改”后
    @RequestMapping("/selectProductByid.action")
    public String selectProductByid(Integer id, Model model) throws SQLException {
        Product product = productDao.getProductByid(id);
        if (product != null) {
            model.addAttribute("product", product);
            return "billUpdate";
        } else {
            return "redirect:billList.action";
        }
    }

    //进入billUpdate页面 点击 “保存”后
    @RequestMapping("/productUpdate.action")
    public String productUpdate(Product product) throws SQLException {
        boolean update = productDao.updateProduct(product);//通过updateProduct方法进行判断
        if (update) {//修改成功
            return "redirect:billList.action";
        } else {//修改失败
            return "billUpdate";
        }
    }

    //点击"删除"后
    @RequestMapping("/deleteProduct.action")
    public String deleteProduct(Integer id) throws SQLException {
        boolean delete = productDao.deleteProductByid(id);//用deleteProductByid进行判断
        return "redirect:billList.action";
    }

    //点击“图书借阅”后
    @RequestMapping("/bill2.action")
    public ModelAndView bill2(@RequestParam(required = false, defaultValue = "1", value = "page") int page) throws SQLException {
        PageHelper.startPage(page, 5);
        ModelAndView mad = new ModelAndView();
        List<Product> productList = productDao.getProductList(null);
        PageInfo pageinfo = new PageInfo(productList);
        mad.addObject("pageinfo", pageinfo);
        mad.setViewName("bill2");
        return mad;
    }

    //点击“借阅”后
    @RequestMapping("/borrow.action")
    public String borrow(Product pr) throws Exception {
        Integer userid = (Integer) request.getSession().getAttribute("id");
        Borrow borrow = new Borrow();
        borrow.setUserid(userid);
        borrow.setProductid(pr.getId());
        productDao.borrow(borrow);
        productDao.borrowUpdate(pr);
        return "redirect:/bill2.action";
    }


    //点击“还书”后
    @RequestMapping("/repay.action")
    public String repay(Product pr) throws Exception {
        Integer userid = (Integer) request.getSession().getAttribute("id");
        Borrow borrow = new Borrow();
        borrow.setUserid(userid);
        borrow.setProductid(pr.getId());
        productDao.repay(borrow);
        productDao.repayUpdate(pr);
        return "forward:/bill2.action";
    }

}
