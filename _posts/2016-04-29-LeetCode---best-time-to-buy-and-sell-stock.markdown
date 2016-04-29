---
layout: default
title:  LeetCode---best-time-to-buy-and-sell-stock
date: 2016-04-29 19:33:01 +0800 
categories: main
---


题目描述
=
	Say you have an array for which the ith element is the price of a given stock on day i.
If you were only permitted to complete at most one transaction (ie, buy one and sell one share of the stock), design an algorithm to find the maximum profit.

程序代码
=

1.写出来的就是低能，好吧O(n2)了
-
```
	
	public int maxProfit(int[] prices) {
		if (prices.length <= 1) {
			return 0;
		}

		int profit = 0;
		for (int i = 0; i < prices.length; i++) {

			for (int j = i + 1; j < prices.length; j++) {
				profit = Math.max(prices[j] - prices[i], profit);
			}

		}

		return profit;
	}
```



2.啧啧
-
```
	public int maxProfit(int[] prices) {
		if (prices.length <= 1) {
			return 0;
		}

		int profit = 0;
		int min = prices[0];
		for (int i = 1; i < prices.length; i++) {

			min = Math.min(min, prices[i]);
			profit = Math.max(profit, prices[i] - min);

		}

		return profit;
	}
```

