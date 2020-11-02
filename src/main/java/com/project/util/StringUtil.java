package com.project.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class StringUtil {

	/**
	 * 주의! 파일 리스트와 스트링 리스트만 넣을것!
	 * @param list
	 * @return String
	 */
	public String makeString(List<String> fileNameList, List<String> contentList, String splitText) {
		String result = "";
		
		if(fileNameList.size() != contentList.size()) {//텍스트랑 이미지가 짝궁이 안맞을경우
			System.out.println("제대로 넣었는지 다시 확인하세요 이거 프론트에서 끊어야함");
		}
		
		for(int i = 0; i < fileNameList.size(); i++) {
			String fileName = fileNameList.get(i);
			String content = contentList.get(i);
			result += (fileName + splitText + content + splitText);
		}
		
		return result;
	}
	
	/**
	 * fileNameList , List<String>
	 * contentList , List<String> 의 형태로 리턴합니다.
	 * @param text
	 * @return Map<String, List> 
	 */
	public Map<String, List<String>> makeList(String text, String splitText){
		Map<String, List<String>> map = new HashMap(); //리턴할 맵. 리스트를 담음
		List<String> fileNameList = new ArrayList<String>(); //리턴 파일리스트
		List<String> contentList = new ArrayList<String>(); //
		String[] textList = text.split(splitText);
		
		for(int i = 0; i < textList.length; i++) {
			fileNameList.add(textList[i]);
			i++;
			contentList.add(textList[i]);
		}
		
		map.put("fileNameList",fileNameList);
		map.put("contentList", contentList);
		
		return map;
	}
	
	
}
