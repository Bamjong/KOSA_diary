

[직렬화 오류잡는 try / catch]

```java
catch (FileNotFoundException e) {
        System.out.println("파일이 존재하지 않아요");
    } catch (EOFException e) {
        System.out.println("끝 " + e.getMessage());
    } catch (IOException e) {
        System.out.println("파일을 읽을 수 없어요");
    } catch (ClassNotFoundException e) {
        System.out.println("해당 객체가 존재하지 않아요");
    } catch (Exception e) {
        System.out.println("나머지 예외");
    } finally {
			try {
				in.close();     //열어준거 닫기
				bis.close();
				in.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
```

<br><br>

[직렬화 기본 save,load]

```java
Map<String, Book> book_dic = new HashMap<String, Book>();  //이건 예시

FileOutputStream fos = null;	//적을라고 넣음
BufferedOutputStream bos = null; //성늫좋게 넘길려고
ObjectOutputStream out = null;	//객체 통신을 위해 넣음

FileInputStream fis = null;	
BufferedInputStream bis = null; 
ObjectInputStream in = null;	
```

[직렬화 save]

```java
void save(Map<String, Book> book_dic) {
			
        try {
            
            fos = new FileOutputStream(filename);
            bos = new BufferedOutputStream(fos);
            
            //직렬화
            out = new ObjectOutputStream(bos); 
            

            out.writeObject(book_dic);
            
            

            
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                out.close();
                bos.close();
                fos.close();
            } catch (Exception e2) {
                // TODO: handle exception
            }
            
        }
    }
```


<br>

[직렬화 load]

```java

void load() {
    try {
        fis = new FileInputStream(filename);
        bis = new BufferedInputStream(fis);
        in	= new ObjectInputStream(bis);
        
        book_dic = (HashMap)in.readObject();
        
        Set<String> set = book_dic.keySet();
        
        for (String number : set) {
            String isbn = book_dic.get(number).getIsbn();
            String title = book_dic.get(number).getTitle();
            int price = book_dic.get(number).getPrice();
            
            
        }
        
        } catch (FileNotFoundException e) {
            System.out.println("파일이 존재하지 않아요");
        } catch (EOFException e) {
            System.out.println("끝 " + e.getMessage());
        } catch (IOException e) {
            System.out.println("파일을 읽을 수 없어요");
        } catch (ClassNotFoundException e) {
            System.out.println("해당 객체가 존재하지 않아요");
        } catch (Exception e) {
            System.out.println("나머지 예외");
        } finally {
            try {
                in.close();
                bis.close();
                in.close();
            } catch (Exception e2) {
                // TODO: handle exception
            }
        }
}
```
	