import java.util.Scanner;
import java.util.regex.Pattern;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        String domain = "^((http|https)://)?(www.)?([a-zA-Z0-9]+)\\.[a-z]+([a-zA-z0-9.?#]+)?";
        String user = sc.nextLine();

        boolean regex = Pattern.matches(domain, user);
        System.out.println(regex);
    }
}