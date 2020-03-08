/**
 * 
 */
package xxl.tju.st;
import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

/**
 * @author xxltj
 *
 */
public class TestMoney {
	Money money;
	@Before
	public void setUp() {
		money=new Money();
		System.out.println("setup");
	}
	@Test
	public void test() {
		assertTrue("cannot take 70 from pocket", money.change(70));
		assertTrue("cannot take 72 from pocket", money.change(72));
		assertTrue("cannot take 74 from pocket", money.change(74));
		assertTrue("cannot take 75 from pocket", money.change(75));
	}

}
 