package com.example.ss11.service;

import com.example.ss11.Model.Product;

import java.util.List;

public interface ProductService {
    List<Product> getAllProducts();
    Product getProductByName(String name);
    void addProduct(Product product);
    void updateProduct(int id, Product product);
    void deleteProduct(Product product);
    Product findbyID(int id);
    List<Product> searchProductByName(String name);
}
