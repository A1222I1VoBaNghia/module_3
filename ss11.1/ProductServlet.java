package com.example.ss11.Controller;

import com.example.ss11.Model.Product;
import com.example.ss11.Repository.ProductRepository;
import com.example.ss11.Repository.ProductRepositoryImpl;
import com.example.ss11.service.ProductService;
import com.example.ss11.service.ProductServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = "/product")
public class ProductServlet extends HttpServlet {
    private ProductRepository productService = new ProductRepositoryImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action =req.getParameter("action");
        if(action == null){
            action = "list";
        }
        switch (action) {
            case "list":
                viewList(req, resp);
                break;
            case "update":
                viewCreate(req,resp);
                break;
            case "detail":
                viewDetail(req, resp);
                break;
            case "create":
                viewCreate(req, resp);
                break;
            case "delete":
                deleteProduct(req, resp);
                break;
            default:

        }
    }

    private void updateList(HttpServletRequest req, HttpServletResponse resp) {
    }

    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        productService.deleteProduct(productService.findbyID(id));
        resp.sendRedirect("/product?action=list");
    }

    private void viewCreate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products = productService.getAllProducts();
        req.setAttribute("products", products);
        req.getRequestDispatcher("WEB-INF/Views/product/create.jsp")
                .forward(req,resp);
    }

    private void viewDetail(HttpServletRequest req, HttpServletResponse resp) {

    }

    private void viewList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products = productService.getAllProducts();
        req.setAttribute("products", products);
        req.getRequestDispatcher("WEB-INF/Views/product/list.jsp")
                .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            resp.sendRedirect("/product?action=list");
            return;
        }

        switch (action) {
            case "create":
                doCreate(req, resp);
                break;
            case "update":
                doUpdate(req,resp);
                break;
            default:
        }
    }

    private void doUpdate(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        int price = Integer.parseInt(req.getParameter("price"));
        String date = req.getParameter("dateRelease");
        SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
        String manufacturer = req.getParameter("manufacturer");
        Date dateRelease = null;
        try {
            dateRelease = format.parse(date);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        Product product = new Product(id, name, quantity, price, dateRelease, manufacturer);
        productService.updateProduct(id, product);
        resp.sendRedirect("/product?action=list");
    }

    private void doCreate(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        int price = Integer.parseInt(req.getParameter("price"));
        String date = req.getParameter("dateRelease");
        SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
        String manufacturer = req.getParameter("manufacturer");
        Date dateRelease = null;
        try {
            dateRelease = format.parse(date);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        Product product = new Product(id, name, quantity, price, dateRelease, manufacturer);
        productService.addProduct(product);
        resp.sendRedirect("/product?action=list");
    }
}
