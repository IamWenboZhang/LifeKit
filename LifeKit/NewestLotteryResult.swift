//
//	Result.swift
//
//	Create by Shine on 12/10/2016
//	Copyright © 2016. All rights reserved.
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class NewestLotteryResult{

	var code : String!
	var expect : String!
	var name : String!
	var openCode : String!
	var time : String!
	var timestamp : Int!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		code = dictionary["code"] as? String
		expect = dictionary["expect"] as? String
		name = dictionary["name"] as? String
		openCode = dictionary["openCode"] as? String
		time = dictionary["time"] as? String
		timestamp = dictionary["timestamp"] as? Int
	}

}