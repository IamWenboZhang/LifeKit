//
//	PoemShowapiResBody.swift
//
//	Create by Shine on 14/12/2016
//	Copyright © 2016. All rights reserved.
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class PoemShowapiResBody{

	var list : [String]!
	var retCode : Int!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		list = dictionary["list"] as? [String]
		retCode = dictionary["ret_code"] as? Int
	}

}