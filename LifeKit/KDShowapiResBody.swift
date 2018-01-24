//
//	KDShowapiResBody.swift
//
//	Create by Shine on 9/12/2016
//	Copyright © 2016. All rights reserved.
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class KDShowapiResBody{

	var data : [KDData]!
	var expSpellName : String!
	var expTextName : String!
	var flag : Bool!
	var mailNo : String!
	var retCode : Int!
	var status : Int!
	var tel : String!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		data = [KDData]()
		if let dataArray = dictionary["data"] as? [NSDictionary]{
			for dic in dataArray{
				let value = KDData(fromDictionary: dic)
				data.append(value)
			}
		}
		expSpellName = dictionary["expSpellName"] as? String
		expTextName = dictionary["expTextName"] as? String
		flag = dictionary["flag"] as? Bool
		mailNo = dictionary["mailNo"] as? String
		retCode = dictionary["ret_code"] as? Int
		status = dictionary["status"] as? Int
		tel = dictionary["tel"] as? String
	}

}