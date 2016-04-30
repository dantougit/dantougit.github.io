---
layout: default
title:  LeetCode---unique-paths
date: 2016-04-30 19:27:30 +0800 
categories: main
---

题目描述
=
	A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
	The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).
	How many possible unique paths are there?

程序代码
=

1.好吧，狗屎一样的递归，速度太慢
-
```
	public int uniquePaths(int m, int n) {
		if (n < 1 || m < 1) {
			return 0;
		}

		if (n == 1 && m == 1) {
			return 0;
		}

		if (n == 1 || m == 1) {
			return 1;
		}

		return uniquePaths(n, m - 1) + uniquePaths(n - 1, m);

	}
```



2.好吧，排列组合，比最优解慢一点，阶乘不好算啊。。
-

```
	public int uniquePaths(int m, int n) {

		if (n < 1 || m < 1) {
			return 0;
		}

		if (n == 1 || m == 1) {
			return 1;
		}

		return jiecheng(n + m - 2).divide(
				jiecheng(n - 1).multiply(jiecheng(m - 1))).intValue();
	}

	public BigDecimal jiecheng(int i) {

		if (i <= 0) {
			return new BigDecimal(1);
		}

		BigDecimal prob = new BigDecimal(1);
		while (i > 0) {
			prob = prob.multiply(new BigDecimal(i));
			i--;
		}

		return prob;
	}
	
```

3.别人的答案
-

```

	public int uniquePaths(int m, int n) {
		int[][] data = new int[m][n];
		for (int i = 0; i != m; ++i)
			for (int j = 0; j != n; ++j) {
				if (i == 0 || j == 0)
					data[i][j] = 1;
				else
					data[i][j] = data[i - 1][j] + data[i][j - 1];
			}
		return data[m - 1][n - 1];
	}

```

