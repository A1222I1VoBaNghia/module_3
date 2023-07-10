package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class CustomerService{
   static List<Customer> customerList = new ArrayList<>();
   static {
       customerList.add(new Customer("Mai Văn Hoàng","1983-08-20","Hà Nội","image/BLUE STORE.png"));
       customerList.add(new Customer("Nguyễn Văn Nam","1983-08-21","Thái Bình","image/BLUE STORE (1).png"));
       customerList.add(new Customer("Nguyễn Thái HÒa ","1983-08-22","Nam Đinh","image/BLUE STORE (2).png"));
       customerList.add(new Customer("Trần Đăng Khoa","1983-08-23","Hà Nội","image/BLUE STORE (2).png"));
       customerList.add(new Customer("Nguyễn Đình Thi","1983-08-24","Hà Nam","image/BLUE STORE (2).png"));
    }

    public List<Customer> getCustomerList() {
        return customerList;
    }
}
