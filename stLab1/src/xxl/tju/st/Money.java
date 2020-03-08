/**
 * 
 */
package xxl.tju.st;

import java.util.HashSet;
import java.util.Set;

/**
 * @author xxltj
 *
 */
public class Money {

	/**
	 * @param args
	 */
	public boolean change(int x) {
		Set<Integer> set = new HashSet<>();
		// 5o元,20元,10元各一张,5元2张，1元3张
		for (int i = 0; i <= 1; i++) {
			for (int j = 0; j <= 1; j++) {
				for (int k = 0; k <= 1; k++) {
					for (int m = 0; m <= 2; m++) {
						for (int n = 0; n <= 3; n++) {
							set.add(50 * i + 20 * j + 10 * k + 5 * m + n);
						}
					}
				}
			}
		}
		return set.contains(x);

	}

}
