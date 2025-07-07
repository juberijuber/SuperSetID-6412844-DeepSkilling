public class Main {
    public static void main(String[] args) {
        Product[] products = {
                new Product(1, "Laptop", "Electronics"),
                new Product(2, "Shoes", "Fashion"),
                new Product(3, "Book", "Education")
        };

        Product foundLinear = LinearSearch.search(products, "Shoes");
        System.out.println("Linear Search: " + (foundLinear != null ? foundLinear.getProductName() : "Not Found"));

        Product foundBinary = BinarySearch.search(products, "Shoes");
        System.out.println("Binary Search: " + (foundBinary != null ? foundBinary.getProductName() : "Not Found"));
    }
}
