//
//	KDComShowapiResBody.swift
//
//	Create by Shine on 11/5/2017
//	Copyright © 2017. All rights reserved.
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class KDComShowapiResBody{

	var expressList : [KDComExpressList]!
	var flag : Bool!
	var retCode : Int!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		expressList = [KDComExpressList]()
		if let expressListArray = dictionary["expressList"] as? [NSDictionary]{
			for dic in expressListArray{
				let value = KDComExpressList(fromDictionary: dic)
				expressList.append(value)
			}
		}
		flag = dictionary["flag"] as? Bool
		retCode = dictionary["ret_code"] as? Int
	}

}