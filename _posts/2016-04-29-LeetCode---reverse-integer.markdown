---
layout: default
title:  LeetCode---reverse-integer
date: 2016-04-29 11:19:49 +0800 
categories: main
---


题目描述
=

	Reverse digits of an integer.
	Example1: x = 123, return 321
	Example2: x = -123, return -321
	click to show spoilers.
	Have you thought about this?
	Here are some good questions to ask before coding. Bonus points for you if you have already thought through this!
	If the integer's last digit is 0, what should the output be? ie, cases such as 10, 100.
	Did you notice that the reversed integer might overflow? Assume the input is a 32-bit integer, then the reverse of 1000000003 overflows. How should you handle such cases?
	Throw an exception? Good, but what if throwing an exception is not an option? You would then have to re-design the function (ie, add an extra parameter).

程序代码
=

1.字符串（low比的我 首先想到的竟然是字符串） 117ms
-
```
	public int reverse(int x) {
		String z = "";
		String y = x + "";
		if (x < 0) {
			y = y.substring(1);
			z = "-";
			for (int i = y.length() - 1; i >= 0; i--) {
				z += y.charAt(i);
			}
		} else {
			for (int i = y.length() - 1; i >= 0; i--) {
				z += y.charAt(i);
			}
		}

		try {
			return Integer.parseInt(z);
		} catch (Exception e) {
			return 0;
		}
	}
```



2.第二个想到的 85ms
-
```
	public int reverse(int x) {

		Queue<Integer> nums = new LinkedList<>();
		int i = 1;
		while (x > 0) {
			nums.add(x % 10);
			x /= 10;
			i *= 10;
		}

		while (x < 0) {
			nums.add(x % 10);
			x /= 10;
			i *= 10;
		}

		int re = 0;

		while (!nums.isEmpty()) {
			i /= 10;
			re += nums.remove() * i;
		}

		return re;
	}
```

3.别人的答案，好我很多64ms
-
```
	public int reverse(int x) {
		if (x >= 0) {
			int p = 0;
			while (x > 0) {
				p = p * 10 + x % 10;
				x /= 10;
			}
			return p;
		} else {
			x = -x;
			int p = 0;
			while (x > 0) {
				p = p * 10 + x % 10;
				x /= 10;
			}
			return -p;
		}
	}
```
