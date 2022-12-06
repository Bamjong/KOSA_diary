package DI_05_Spring;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class HelloApp {
	public static void main(String[] args) {
		/*
		MyBean mybean = new MyBean();
		MyBean mybean2 = new MyBean("hong");
		MyBean mybean3 = new MyBean();
		
		System.out.println(mybean + " , " + mybean2 + " , " + mybean3);
		
		Singleton single = Singleton.getInstance();
		Singleton single2 = Singleton.getInstance();
		Singleton single3 = Singleton.getInstance();
		
		System.out.println(single + " , " + single2 + " , " + single3);
		*/
		
		ApplicationContext context = new GenericXmlApplicationContext("classpath:DI_05_Spring/DI_05.xml");
		MyBean m = context.getBean("mybean", MyBean.class);
		MyBean m2 = context.getBean("mybean", MyBean.class);
		MyBean m3 = context.getBean("mybean", MyBean.class);
		System.out.println(m);
		System.out.println(m2);
		System.out.println(m3);
		
		
		Singleton single = context.getBean("single", Singleton.class);
		Singleton single2 = context.getBean("single", Singleton.class);
				
		System.out.println(single + " , " + single2);
		
		/*
			getBean()
			1. 컨테이너 안에 있는 객체를 리턴 (new가 아니에요)
			2. return type Object (타입에 맞는 casting)
			3. **스프림 컨테이너 안에 객체들은 default singleton
			4. **예외적으로 getbean() 설정을 바꾸면 new 할 수 있지만 99% 사용하지 않음
		 */
	
	}
}
