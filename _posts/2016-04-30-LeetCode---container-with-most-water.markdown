---
layout: default
title:  LeetCode---container-with-most-water
date: 2016-04-30 23:58:13 +0800 
categories: main
---


题目描述
=
	Given n non-negative integers a1, a2, ..., an, where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.

程序代码
=

1.o(n2)
-
```
	
	public int maxArea(int[] height) {

		if (height.length <= 1) {
			return 0;
		}

		int s = 0;

		for (int i = 0; i < height.length; i++) {
			for (int j = i + 1; j < height.length; j++) {
				s = Math.max(s, area(height, i, j));
			}
		}

		return s;
	}
	
	public int area(int[] height, int i, int j) {
		return (j - i) * Math.min(height[j], height[i]);
	}
```



2.一开始觉得应该这样写，写了半天没写对，关键点在于动左边还是动右边。哎
-

```
	
	public int maxArea(int[] height) {

		if (height.length <= 1) {
			return 0;
		}

		int max = 0;
		int s = 0;
		int i = 0;
		int j = height.length - 1;

		while (i < j) {

			s = area(height, i, j);
			max = Math.max(max, s);

			if (height[i] > height[j]) {
				j--;
			} else {
				i++;
			}

		}

		return max;
	}
	
```
