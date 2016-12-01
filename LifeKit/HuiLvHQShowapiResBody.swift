//
//	HuiLvHQShowapiResBody.swift
//
//	Create by Shine on 30/11/2016
//	Copyright © 2016. All rights reserved.
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class HuiLvHQShowapiResBody{

	var list : [HuiLvHQList]!
	var listSize : Int!
	var retCode : Int!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		list = [HuiLvHQList]()
		if let listArray = dictionary["list"] as? [NSDictionary]{
			for dic in listArray{
				let value = HuiLvHQList(fromDictionary: dic)
				list.append(value)
			}
		}
		listSize = dictionary["listSize"] as? Int
		retCode = dictionary["ret_code"] as? Int
	}

}