public class Logger {
    private static Logger obj;

    private Logger() {
        System.out.println("Logger instance created");
    }

    public static Logger get() {
        if (obj == null) {
            obj = new Logger();
        }
        return obj;
    }

    public void log(String msg) {
        System.out.println("Log: " + msg);
    }
}
