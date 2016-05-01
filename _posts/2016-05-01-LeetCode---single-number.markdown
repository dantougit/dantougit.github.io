---
layout: default
title:  LeetCode---single-number
date: 2016-05-01 13:12:12 +0800 
categories: main
---


题目描述
=
	
	Given an array of integers, every element appears twice except for one. Find that single one.

程序代码
=

```
	
	public int singleNumber(int[] A) {
		int num = 0;
		for (int i = 0; i < A.length; i++) {
			num ^= A[i];
		}
		return num;
	}
```

