

temp[i]를 만들어서 a.lenght 만큼 넣어준 후 
int i를 포인터 개념으로 잡아 a.length 이후로 b를 넣게되어
다 넣은값을 return 해줄 수 있다.

```java
class ArrayUtil{
    public static int[] concat(int[] a, int[] b){
        int temp[] = new int[a.length + b.length];
        int i = 0;

        for(; i<a.length; i++) {
            temp[i] = a[i];
        }
        for(;i<a.length+b.length;i++) {
        temp[i] = b[i-a.length];
        }
        return temp;
    }
    public static void print(int[] a) { 
        System.out.print("[");
        for(int i=0; i<a.length;i++) {
           System.out.print(" "+a[i]+" ");
        }
        System.out.print("]");
     }
}



public class Main{
    public static void main(String[] args) {
        int [] array1 = {1, 5, 7, 9};
        int [] array2 = {3, 6, -1, 100, 77};
        int [] array3 = ArrayUtil.concat(array1, array2);
        ArrayUtil.print(array3);
    }
}
```

### 출력
    [ 1  5  7  9  3  6  -1  100  77 ]