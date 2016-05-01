---
layout: default
title:  LeetCode---maximum-subarray
date: 2016-05-01 12:17:37 +0800 
categories: main
---

题目描述
=
	
	Find the contiguous subarray within an array (containing at least one number) which has the largest sum.
	For example, given the array[−2,1,−3,4,−1,2,1,−5,4], the contiguous subarray[4,−1,2,1]has the largest sum =6.

程序代码
=

```
	
	public int maxSubArray(int[] A) {

		if (A.length < 1) {
			return 0;
		}

		int max = A[0];
		int sum = max;

		for (int i = 1; i < A.length; i++) {

			if (sum < 0) {
				sum = A[i];
			} else {
				sum += A[i];
			}

			max = Math.max(max, sum);
		}

		return max;
	}
```

