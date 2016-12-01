//
//	ShowapiResBody.swift
//
//	Create by Shine on 8/11/2016
//	Copyright © 2016. All rights reserved.
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class ConstellationShowapiResBody{

	var day : Day!
	var retCode : Int!
	var star : String!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		if let dayData = dictionary["day"] as? NSDictionary{
			day = Day(fromDictionary: dayData)
		}
		retCode = dictionary["ret_code"] as? Int
		star = dictionary["star"] as? String
	}

}