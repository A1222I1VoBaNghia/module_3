package com.example.ss11.service;

import com.example.ss11.Model.Product;
import com.example.ss11.Repository.ProductRepositoryImpl;

import java.util.ArrayList;
import java.util.List;

public class ProductServiceImpl implements ProductService{
    private List<Product> products = new ArrayList<>();

;
    @Override
    public List<Product> getAllProducts() {
        return products;
    }

    @Override
    public Product getProductByName(String name) {
        for (Product p:products) {
            if(p.getName().equals(name)){
                return p;
            }
        }
        return null;
    }

    @Override
    public void addProduct(Product product) {
        products.add(product);
    }

    @Override
    public void updateProduct(int id, Product product) {
        for(Product p: products){
            if(p.getId() == id){
             products.set(id,new Product());
            }
        }
    }

    @Override
    public void deleteProduct(Product product) {
                products.remove(product);
    }

    @Override
    public Product findbyID(int id) {
        for (Product p : products) {
            if (p.getId() == id) {
                return p;
            }
        }
        return null;
    }
    @Override
    public List<Product> searchProductByName(String name) {
        List<Product> newProduct = new ArrayList<>();
        for(Product p: products){
            if(p.getName().equals(name)){
                newProduct.add(p);
            }
        }
        return newProduct;
    }
}
