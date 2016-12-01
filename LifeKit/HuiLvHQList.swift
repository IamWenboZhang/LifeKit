//
//	HuiLvHQList.swift
//
//	Create by Shine on 30/11/2016
//	Copyright © 2016. All rights reserved.
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class HuiLvHQList{

	var chaoIn : String!
	var chaoOut : String!
	var code : String!
	var day : String!
	var huiIn : String!
	var huiOut : String!
	var name : String!
	var time : String!
	var zhesuan : String!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		chaoIn = dictionary["chao_in"] as? String
		chaoOut = dictionary["chao_out"] as? String
		code = dictionary["code"] as? String
		day = dictionary["day"] as? String
		huiIn = dictionary["hui_in"] as? String
		huiOut = dictionary["hui_out"] as? String
		name = dictionary["name"] as? String
		time = dictionary["time"] as? String
		zhesuan = dictionary["zhesuan"] as? String
	}

}