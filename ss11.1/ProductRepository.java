package com.example.ss11.Repository;

import com.example.ss11.Model.Product;

import java.util.List;

public interface ProductRepository {
    List<Product> getAllProducts();
    Product getProductById(int id);
    void addProduct(Product product);
    void updateProduct(int id, Product product);
    void deleteProduct(Product product);
    List<Product> searchProductByName(String name);

    Product findbyID(int id);
}
