---
layout: default
title:  LeetCode---maximum-depth-of-binary-tree
date: 2016-04-28 22:23:12 +0800 
categories: main
---

题目描述
=

	Given a binary tree, find its maximum depth.
	The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

程序代码
=

1.递归
-
```
	class TreeNode {
		int val;
		TreeNode left;
		TreeNode right;
	
		TreeNode(int x) {
			val = x;
		}
	}

	public int maxDepth(TreeNode root) {

		if (root == null) {
			return 0;
		}

		return Math.max(maxDepth(root.left) + 1, maxDepth(root.right) + 1);
	}
```



2.非递归
-
```
	public int maxDepth(TreeNode root) {

		if (root == null) {
			return 0;
		}

		List<TreeNode> tree = new LinkedList<TreeNode>();
		tree.add(root);
		
		int i = 0;
		while (tree.size() != 0) {
			List<TreeNode> tree1 = new LinkedList<TreeNode>();
			for (TreeNode node : tree) {
				tree1.add(node);
			}
			tree.clear();
			for (TreeNode node : tree1) {

				if (node.left != null) {
					tree.add(node.left);
				}

				if (node.right != null) {
					tree.add(node.right);
				}

			}
			i++;
		}
		return i;
	}
```

第一次写markdown，很烂。  
这个题很简单，但是怎么才能优化呢。  
看了一下其他人用C写的速度很快,也是用递归写的。

