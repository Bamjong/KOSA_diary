# 📚 Day87_221221

Author: 고범종
Created Time: 2022년 12월 21일 오전 9:06
Status: 🖨 Published
Tags: Spring, ajax, 비동기
Updated Time: 2022년 12월 21일 오후 2:17

# 1. Spring 비동기 처리하기

SpringMVC_Basic16_Ajax 참고

pom.xml

```java
<!-- jackson  lib  -->
    	<!-- https://mvnrepository.com/artifact/com.fasterxml.jackson.core/jackson-databind -->
		<dependency>
    		<groupId>org.codehaus.jackson</groupId>
    		<artifactId>jackson-core-asl</artifactId>
    		<version>1.9.13</version>
		</dependency>
		<dependency>
		    <groupId>com.fasterxml.jackson.core</groupId>
		    <artifactId>jackson-databind</artifactId>
		    <version>2.13.4.1</version>
		</dependency>
```

- ajax쓰려면 무조건 필요함

예시)

@Controller

```java
@Controller
public class AjaxController {

	//org.springframework.web.servlet.view.json.MappingJackson2JsonView
	//View 인터페이스 부모타입
	@Autowired
	public View jsonview;
	
	//command=AjaxTest&name=java&arr="+array
	@RequestMapping("json.kosa")
	public View jsonkosa(String command, String name, String [] arr, ModelMap map) {
		
		System.out.println("command: " + command);
		System.out.println("name: " + name);
		System.out.println("arr: " + arr);
		System.out.println("Arrays.toString(): " + Arrays.toString(arr));

		ArrayList<String> list = new ArrayList<String>();
		list.add("치킨");
		list.add("맥주");
		list.add("피자");
		
		map.addAttribute("menu", list); // View단에 전달
		
		return jsonview;
		//<bean name="jsonview" 객체와 동일한 이름)
		//map.addAttribute("menu", list); 자원을 자동으로 json객체로 변환해서 클라이언트에게 비동기 전달
	}
}
```

## 결국

- servlet-context.xml에서 json 작성한 name과 Controller의 return이름과 같아야한다

---

## @ResponseBody

SpringMVC_Basic17_Ajax

```java
@Controller
public class AjaxController {

	
	@RequestMapping("response.kosa")
	public @ResponseBody Employee add(HttpServletRequest request, HttpServletResponse response) {
		//HttpServletRequest request 가장 전통적인 방법
		
		Employee employee = new Employee();
		employee.setFirstname(request.getParameter("firstName"));
		employee.setLastname(request.getParameter("lastName"));
		employee.setEmail(request.getParameter("email"));
		System.out.println(employee.toString());
		return employee; //Employee employee 객체를 리턴 {"firstname":"a","lsstname":"b"....}
	}
}
```

---

## @RestController

SpringMVC_Basic18_Rest

- @Controller + 함수(@ResponseBody)