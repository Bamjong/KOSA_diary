    ^((http|https)://)?(www.)?([a-zA-Z0-9]+)\\.[a-z]+([a-zA-z0-9.?#]+)?

- http나 https로 시작하는 경우에는 ://가 반드시 붙는다. Optional.
- www. 로 시작하는 경우가 있다. Optional.
- 알파벳 혹은 숫자를 포함한 문자열이 반드시 1개 이상 있다.
- 이후에 . 이 반드시 하나 포함된다. (.)
- . 를 기점으로 이후에 소문자가 반드시 1개 이상 포함됨
- 이후에는 계속해서 영문자, 숫자, 특수문자가 붙을 수 있다.

<br>

### 코드로 확인해보자

```java
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

//^((http|https)://)?(www.)?([a-zA-Z0-9]+)\\.[a-z]+([a-zA-z0-9.?#]+)?

//((http|https)://)? : http or https 이후 :// 가 붙는지를 0번 또는 1차례 발생 확인
//(www.)? : www. 이 0번 또는 1차례 발생 확인
//[a-zA-Z0-9]+\\ : 영문/영대문자/숫자가 무조건 있는지, "_"를 제외하여 영숫자가 아닌 문자열들과 일치시키기
//.[a-z]+([a-zA-z0-9.?#]+)? : . 이후에 소문자가 한번이상 반복하고 영문/영대문자/숫자가 무조건 있는지 이후 종료
```

출력
    https://github.com
    true


<br><br><br>
출처: [https://juneyr.dev/2019-03-04/java-url-regex](https://juneyr.dev/2019-03-04/java-url-regex)