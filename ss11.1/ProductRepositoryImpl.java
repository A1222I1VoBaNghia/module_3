package com.example.ss11.Repository;

import com.example.ss11.Model.Product;

import java.util.*;

public class ProductRepositoryImpl implements ProductRepository {
    static List<Product> products = new ArrayList<>();

    static {
        products.add(new Product(1, "Iphone 14", 10, 1500, new Date(), "Apple"));
        products.add(new Product(2, "Iphone 14 pro", 16, 1700, new Date(), "Apple"));
        products.add(new Product(3, "Iphone 14 pro max", 20, 2000, new Date(), "Apple"));
        products.add(new Product(4, "Samsung ZFlip", 12, 1600, new Date(), "Samsung"));
        products.add(new Product(5, "Samsung Galaxy S20 Ultra", 30, 1200, new Date(), "Samsung"));
    }

    @Override
    public List<Product> getAllProducts() {
        return products;
    }

    @Override
    public Product getProductById(int id) {
        for (Product p : products) {
            if (p.getId() == id) {
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
        for (Product p : products) {
            if (p.getId() == id) {
               p.setName(product.getName());
               p.setQuantity(product.getQuantity());
               p.setPrice(product.getPrice());
               p.setDateRelease(product.getDateRelease());
               p.setManufacturer(product.getManufacturer());
                products.set(id,p);
            }
        }
    }

    @Override
    public void deleteProduct(Product product) {
        products.remove(product);
    }

    @Override
    public List<Product> searchProductByName(String name) {
        List<Product> newProduct = new ArrayList<>();
        for (Product p : products) {
            if (p.getName().equals(name)) {
                newProduct.add(p);
            }
        }
        return newProduct;
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
}
