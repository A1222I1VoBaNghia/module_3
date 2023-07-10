package Controller;

import model.Customer;
import model.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerListServlet", urlPatterns = "/customer")
public class CustomerListServlet extends HttpServlet {
    private CustomerService customers = new CustomerService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = customers.getCustomerList();
        request.setAttribute("customerList",customerList);
        request.getRequestDispatcher("/customer/list_customer.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
