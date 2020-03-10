package com.zz.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;

public class JsonUtil {

	public static JSONArray parseArray(String text){
		JSONArray jsonArray = JSON.parseArray(text);
		return jsonArray;
	}
}
