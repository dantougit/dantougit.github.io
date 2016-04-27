---
layout: default
title:  "Welcome to Jekyll!"
date:
categories: main
---

{% highlight java %}

package hello;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;

import javax.imageio.ImageIO;

public class Image {
	public static void main(String[] args) throws Exception {
		createImage("/Users/zl/Downloads/1.jpeg",
				"/Users/zl/Downloads//11.jpeg", 1);
		createImage("/Users/zl/Downloads/1.jpeg",
				"/Users/zl/Downloads/15.jpeg", 5);
		createImage("/Users/zl/Downloads/1.jpeg",
				"/Users/zl/Downloads/110.jpeg", 10);
		createImage("/Users/zl/Downloads/1.jpeg",
				"/Users/zl/Downloads/150.jpeg", 50);
		createImage("/Users/zl/Downloads/1.jpeg",
				"/Users/zl/Downloads/1100.jpeg", 100);
		createImage("/Users/zl/Downloads/1.jpeg",
				"/Users/zl/Downloads/1500.jpeg", 500);
		createImage("/Users/zl/Downloads/1.jpeg",
				"/Users/zl/Downloads/11000.jpeg", 1000);
	}

	public static void createImage(String input, String output, int colors)
			throws Exception {

		BufferedImage image = ImageIO.read(new File(input));
		int height = image.getHeight();
		int width = image.getWidth();
		List<Double> rgbs = new LinkedList<>();

		for (int i = 0; i < height; i++) {

			for (int j = 0; j < width; j++) {
				rgbs.add(image.getRGB(j, i) * 1.0);
			}

		}
		Queue<Integer> newRgbs = getNewRgbs(rgbs, colors);
		for (int i = 0; i < height; i++) {
			for (int j = 0; j < width; j++) {
				image.setRGB(j, i, newRgbs.remove());
			}
		}

		ImageIO.write(image, "jpeg", new File(output));

	}

	public static Queue<Integer> getNewRgbs(List<Double> rgbs, int k) {

		Queue<Integer> newRgbs = new LinkedList<>();
		List<Double> centers = cluster(rgbs, k);
		for (Double rgb : rgbs) {

			Double newCenter = centers.get(0);
			for (Double center : centers) {
				newCenter = distance(rgb, center) < distance(rgb, newCenter) ? center
						: newCenter;
			}
			newRgbs.add((int) Math.round(newCenter));
		}
		return newRgbs;

	}

	public static List<Double> cluster(List<Double> rgbs, int k) {

		List<Double> centers = new LinkedList<Double>();
		List<Double> oldCenters = new LinkedList<Double>();
		while (true) {
			Double index = rgbs.get((int) (Math.random() * rgbs.size()));

			if (!centers.contains(index)) {
				centers.add(index);
			}

			if (centers.size() >= k) {
				break;
			}
		}

		while (true) {
			System.out.println(centers);
			Map<Double, List<Double>> clusters = new LinkedHashMap<>();

			for (Double center : centers) {
				clusters.put(center, new LinkedList<Double>());
			}

			for (Double rgb : rgbs) {
				Double newCenter = centers.get(0);
				for (Double center : centers) {
					newCenter = distance(rgb, center) < distance(rgb, newCenter) ? center
							: newCenter;
				}
				clusters.get(newCenter).add(rgb);
			}

			oldCenters.clear();
			for (Double center : centers) {
				oldCenters.add(center);
			}

			centers.clear();
			for (Map.Entry<Double, List<Double>> entry : clusters.entrySet()) {
				double sum = 0;
				List<Double> vals = entry.getValue();
				for (Double val : vals) {
					sum += val;
				}
				double mean = sum / vals.size();
				centers.add(mean);
			}

			Double change = 0.0;
			for (int i = 0; i < k; i++) {
				change += distance(centers.get(i), oldCenters.get(i));
			}
			System.out.println(change);
			if (change < 1) {
				break;
			}

		}
		return centers;
	}

	public static Double distance(Double i, Double j) {
		return Math.abs(i - j);
	}
}


{% endhighlight %}

