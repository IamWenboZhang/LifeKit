//
//	HuiLvShowapiResBody.swift
//
//	Create by Shine on 30/11/2016
//	Copyright © 2016. All rights reserved.
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class HuiLvShowapiResBody{

	var money : String!
	var retCode : Int!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		money = dictionary["money"] as? String
		retCode = dictionary["ret_code"] as? Int
	}

}