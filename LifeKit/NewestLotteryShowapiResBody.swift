//
//	ShowapiResBody.swift
//
//	Create by Shine on 12/10/2016
//	Copyright © 2016. All rights reserved.
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class NewestLotteryShowapiResBody{

	var result : [LotteryResult]!
	var retCode : Int!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		result = [LotteryResult]()
		if let resultArray = dictionary["result"] as? [NSDictionary]{
			for dic in resultArray{
				let value = LotteryResult(fromDictionary: dic)
				result.append(value)
			}
		}
		retCode = dictionary["ret_code"] as? Int
	}

}