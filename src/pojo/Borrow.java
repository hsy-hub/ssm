package pojo;

public class Borrow {
    Integer id;
    Integer productid;
    Integer userid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProductid() {
        return productid;
    }

    public void setProductid(Integer productid) {
        this.productid = productid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    @Override
    public String toString() {
        return "borrow{" +
                "id=" + id +
                ", productid=" + productid +
                ", userid=" + userid +
                '}';
    }
}
