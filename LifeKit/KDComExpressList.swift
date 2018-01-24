//
//	KDComExpressList.swift
//
//	Create by Shine on 11/5/2017
//	Copyright © 2017. All rights reserved.
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class KDComExpressList{

	var expName : String!
	var imgUrl : String!
	var note : String!
	var phone : String!
	var simpleName : String!
	var url : String!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		expName = dictionary["expName"] as? String
		imgUrl = dictionary["imgUrl"] as? String
		note = dictionary["note"] as? String
		phone = dictionary["phone"] as? String
		simpleName = dictionary["simpleName"] as? String
		url = dictionary["url"] as? String
	}

}