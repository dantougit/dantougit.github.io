---
layout: default
title:  LeetCode---valid-sudoku
date: 2016-04-30 20:27:25 +0800 
categories: main
---


题目描述
=
	Determine if a Sudoku is valid, according to: Sudoku Puzzles - The Rules.
	The Sudoku board could be partially filled, where empty cells are filled with the character'.'.

程序代码
=

```
	
	public boolean isValidSudoku(char[][] board) {

		if (board.length != 9 || board[0].length != 9) {

			return false;

		}

		for (int i = 0; i < board.length; i++) {
			for (int j = 0; j < board[0].length; j++) {
				if (board[i][j] == '.') {

					continue;

				}

				for (int i2 = 0; i2 < i; i2++) {
					if (board[i][j] == board[i2][j]) {
						return false;
					}
				}

				for (int j2 = 0; j2 < j; j2++) {
					if (board[i][j] == board[i][j2]) {
						return false;
					}
				}

				for (int i2 = i - i % 3; i2 < i; i2++) {
					for (int j2 = j - j % 3; j2 < j - j % 3 + 3; j2++) {
						if (board[i][j] == board[i2][j2]) {
							return false;
						}
					}
				}
			}
		}

		return true;
	}
```
