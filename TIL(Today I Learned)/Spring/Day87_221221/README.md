# ๐ Day87_221221

Author: ๊ณ ๋ฒ์ข
Created Time: 2022๋ 12์ 21์ผ ์ค์  9:06
Status: ๐จ Published
Tags: Spring, ajax, ๋น๋๊ธฐ
Updated Time: 2022๋ 12์ 21์ผ ์คํ 2:17

# 1. Spring ๋น๋๊ธฐ ์ฒ๋ฆฌํ๊ธฐ

SpringMVC_Basic16_Ajax ์ฐธ๊ณ 

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

- ajax์ฐ๋ ค๋ฉด ๋ฌด์กฐ๊ฑด ํ์ํจ

์์)

@Controller

```java
@Controller
public class AjaxController {

	//org.springframework.web.servlet.view.json.MappingJackson2JsonView
	//View ์ธํฐํ์ด์ค ๋ถ๋ชจํ์
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
		list.add("์นํจ");
		list.add("๋งฅ์ฃผ");
		list.add("ํผ์");
		
		map.addAttribute("menu", list); // View๋จ์ ์ ๋ฌ
		
		return jsonview;
		//<bean name="jsonview" ๊ฐ์ฒด์ ๋์ผํ ์ด๋ฆ)
		//map.addAttribute("menu", list); ์์์ ์๋์ผ๋ก json๊ฐ์ฒด๋ก ๋ณํํด์ ํด๋ผ์ด์ธํธ์๊ฒ ๋น๋๊ธฐ ์ ๋ฌ
	}
}
```

## ๊ฒฐ๊ตญ

- servlet-context.xml์์ json ์์ฑํ name๊ณผ Controller์ return์ด๋ฆ๊ณผ ๊ฐ์์ผํ๋ค

---

## @ResponseBody

SpringMVC_Basic17_Ajax

```java
@Controller
public class AjaxController {

	
	@RequestMapping("response.kosa")
	public @ResponseBody Employee add(HttpServletRequest request, HttpServletResponse response) {
		//HttpServletRequest request ๊ฐ์ฅ ์ ํต์ ์ธ ๋ฐฉ๋ฒ
		
		Employee employee = new Employee();
		employee.setFirstname(request.getParameter("firstName"));
		employee.setLastname(request.getParameter("lastName"));
		employee.setEmail(request.getParameter("email"));
		System.out.println(employee.toString());
		return employee; //Employee employee ๊ฐ์ฒด๋ฅผ ๋ฆฌํด {"firstname":"a","lsstname":"b"....}
	}
}
```

---

## @RestController

SpringMVC_Basic18_Rest

- @Controller + ํจ์(@ResponseBody)