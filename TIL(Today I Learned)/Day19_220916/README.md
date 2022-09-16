# 2022년 9월 16일 금요일
<br>


## 1. Calendar Format(캘린더 포맷) (*07_Ex10_Format_Date)






## 2. 직렬화(serialization)



오류잡는 try / catch

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
    }
```


