public class Main {
    public static void main(String[] args) {

        Logger logger1 = Logger.get();
        logger1.log("First logger");

        Logger logger2 = Logger.get();
        logger2.log("Second logger");

        if (logger1 == logger2) {
            System.out.println("Both logger instances are the same. Singleton success.");
        } else {
            System.out.println("Logger instances are different. Singleton failed.");
        }
    }
}
