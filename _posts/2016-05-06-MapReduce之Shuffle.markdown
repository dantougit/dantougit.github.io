---
layout: default
title:  MapReduce之Shuffle
date: 2016-05-06 11:03:31 +0800 
categories: main
---


1.何为Shuffle
=
	Shuffle为map输出到reduce输入的过程，shuffle的单位是每个task。

2.map端
=
	
1⃣.输入
-
	map task从spilt中读取数据,执行map task，产生key－value输出。


2⃣.Partitionner
-
	reduce数量设置了很多个，那么map每一条输出应该由哪个reduce去做，这时候需要partition了，直接上代码很简单。
	
		public class HashPartitioner<K, V> extends Partitioner<K, V> { 

		 	 public int getPartition(K key, V value, int numReduceTasks) { 
		 	   return (key.hashCode() & Integer.MAX_VALUE) % numReduceTasks; 
		 	 } 

		} 
	
	这个是默认的Partitionner，我们可以自己写，继承那类就好
	
3⃣.Spill
-

	进行完Partion之后，需要往磁盘写了，为了减少IO对磁盘的影响，结果是先写到内存中一个缓存区中，缓存区默认大小100M，阀值默认80%，当缓存区数据超过 大小＊阀值，会启动单独线程的spill，锁定这80M内存，进行spill，map输出的数据可以继续往剩下20M写，这样一遍一遍循环。那么spill到底是什么过程
	1.sort，对这80M数据按key进行排序，是MapReduce的默认行为
	2.combine，如果有很多个key/value对需要发送到某个reduce端去，那么需要将这些key/value值拼接到一块，减少与partition相关的索引记录。
	3.Combiner，如果设置了Combiner，会在这里运行。
	
4⃣.Merge
-

	每次溢写会在磁盘上生成一个spill文件，磁盘上可能会有多个spill文件存在。需要将这些溢写文件归并到一起，这个过程就叫做Merge。
	不同spill文件中可能有相同的key，所以得merge成group。什么是group。对于"aaa",1;"aaa",8 merge为{“aaa”, [1,8]}
	如果设置了Combiner，也会在这里运行，可以减少传到其他节点的带宽
	
	
3.reduce端
=

1⃣.Copy
-
	请求map task所在的TaskTracker获取map task的输出文件

2⃣.Merge	
-

	merge有三种形式：1)内存到内存  2)内存到磁盘  3)磁盘到磁盘。默认情况下第一种形式不启用。
	当内存中的数据量到达一定阈值，就启动内存到磁盘的merge。与map 端类似，这也是溢写的过程，这个过程中如果你设置有Combiner，也是会启用的，然后在磁盘中生成了众多的溢写文件。
	第二种merge方式一直在运行，直到没有map端的数据时才结束，然后启动第三种磁盘到磁盘的merge方式生成最终的那个文件。 
	
	
3⃣.Reducer的输入文件
-

	不断地merge后，最后会生成一个最终文件，Shuffle结束

	


