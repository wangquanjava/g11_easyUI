package com.git;

import java.lang.reflect.Field;
import java.util.Arrays;

public class Demo01 {
	public static void main(String[] args) throws Exception {
		Class c = Class.forName("java.lang.String");
		Field[] fields = c.getDeclaredFields();
		System.out.println(Arrays.toString(fields));
		
	}
	public Object createObject(){
		Person person = new Person();
		person.setFriend(new Friend(10));
		person.setName("wang");
		return person;
	}
}
