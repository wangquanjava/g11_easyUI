package com.git.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.git.domain.ResultVO;

/*
 * 这是文件上传的服务器端
 * 总结：
 *    1.文件上传需要common-fileupload.jar和在springMVC中初始化这个上传插件
 *    2.即使上传多张图片，也是一张图片一个请求，一个返回。
 */
@Controller
public class EasyUIController {
	@RequestMapping(value="get")
	public ResponseEntity<ResultVO> uploadFile(){
		
		return ResponseEntity.status(200).body(new ResultVO("what the fuck"));
	}
	@RequestMapping(value="checkCode")
	public ResponseEntity<Boolean> checkCode(){
		
		return ResponseEntity.status(200).body(false);
	}
}
