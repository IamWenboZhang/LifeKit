//
//	KDData.swift
//
//	Create by Shine on 9/12/2016
//	Copyright © 2016. All rights reserved.
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class KDData{

	var context : String!
	var time : String!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		context = dictionary["context"] as? String
		time = dictionary["time"] as? String
	}

}