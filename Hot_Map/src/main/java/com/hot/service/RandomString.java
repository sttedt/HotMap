package com.hot.service;

import java.util.Random;

public class RandomString {
	public String run(int size) {
		char[] chars = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's',
				't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
				'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '1', '2', '3', '4', '5', '6', '7', '8', '9',
				'0' };

		StringBuffer sb = new StringBuffer();
		Random rand = new Random();

		for (int i = 0; i < size; i++) {
			int idx = rand.nextInt(chars.length);
			sb.append(chars[idx]);
		}
		return sb.toString();
	}
}
