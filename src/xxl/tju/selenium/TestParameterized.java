/*此类用于检验学习junit，
非实验作业*/

package xxl.tju.selenium;

import static org.junit.Assert.assertEquals;
import java.util.Arrays;
import java.util.List;

import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameters;

@RunWith(Parameterized.class)
public class TestParameterized {
    
    private int expected;
    private int first;
    private int second;
    private int test0=0;
    private static int test1=0;

    public TestParameterized(int expected, int firstNumber, int secondNumber) {
        this.expected = expected;
        this.first = firstNumber;
        this.second = secondNumber;
    }
    @BeforeClass
    public static void Before() {
    	System.out.println("@BeforeClass");
    }               
    
  @AfterClass
  public static void After() {
  	System.out.println("@AfterClass");
  }   
    
    /**
     * Note: @Parameters annotated method must be public static,
     * otherwise an Exception will thrown.
     */
    @Parameters
    public static List<Integer[]> parameters() {      //比@BeforeClass还要先执行？！！
    	test1+=0.3;      //无效果?
    	System.out.println("@parameters");  //能打印
    	System.out.println("@parameters"+test1);
        return Arrays.asList(new Integer[][]{{3, 1, 2}, {5, 2, 3}, {7, 3, 4}, {9, 4, 5}});//每次一组参数都会调用构造函数，前一次实例对非static修饰的属性操作对后一个实例无影响
    }

    @Test
    public void testAdd() {
        String format = "Using parameters: expect=%d, first=%d, second=%d,test0=%d,test1=%d";
        System.out.println(String.format(format, expected, first, second,test0,test1));
        test0+=1;
        test1+=1;
        
        Feature feature = new Feature();
        assertEquals(expected, feature.add(first, second));
    }
    
    @Test
    public void testPrint() {
        String format = "Print ----------: expect=%d, first=%d, second=%d";
        System.out.println(String.format(format, expected, first, second));
    }
}

class Feature {
    public int add(int i1, int i2) {
        return i1 + i2;
    }
}


//@parameters
//@BeforeClass
//Using parameters: expect=3, first=1, second=2,test0=0,test1=0
//Print ----------: expect=3, first=1, second=2
//Using parameters: expect=5, first=2, second=3,test0=0,test1=1
//Print ----------: expect=5, first=2, second=3
//Using parameters: expect=7, first=3, second=4,test0=0,test1=2
//Print ----------: expect=7, first=3, second=4
//Using parameters: expect=9, first=4, second=5,test0=0,test1=3
//Print ----------: expect=9, first=4, second=5
//@AfterClass



