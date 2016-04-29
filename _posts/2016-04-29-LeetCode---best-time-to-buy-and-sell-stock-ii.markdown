---
layout: default
title:  LeetCode---best-time-to-buy-and-sell-stock-ii
date: 2016-04-29 20:20:00 +0800 
categories: main
---


题目描述
=
	Say you have an array for which the ith element is the price of a given stock on day i.
	Design an algorithm to find the maximum profit. You may complete as many transactions as you like (ie, buy one and sell one share of the stock multiple times). However, you may not engage in multiple transactions at the same time (ie, you must sell the stock before you buy again).

程序代码
=

1.哈哈哈，得了个第一
-
```
	public int maxProfit(int[] prices) {
		if (prices.length <= 1) {
			return 0;
		}

		int min = prices[0];
		int profit = 0;
		for (int i = 1; i < prices.length; i++) {

			if (prices[i] - prices[i - 1] < 0) {
				profit += prices[i - 1] - min;
				min = prices[i];
			}

		}

		profit += prices[prices.length - 1] - min;

		return profit;
	}
	
```

顺便练习下发图片
-

![](photos/1.png)

