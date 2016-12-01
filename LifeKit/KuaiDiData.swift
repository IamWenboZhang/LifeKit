//
//	Data.swift
//
//	Create by Shine on 29/11/2016
//	Copyright © 2016. All rights reserved.
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class KuaiDiData{

	var context : String!
	var ftime : String!
	var time : String!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		context = dictionary["context"] as? String
		ftime = dictionary["ftime"] as? String
		time = dictionary["time"] as? String
	}

}