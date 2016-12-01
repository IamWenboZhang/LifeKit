//
//	ShowapiResBody.swift
//
//	Create by Shine on 12/10/2016
//	Copyright © 2016. All rights reserved.
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class TrafficRestrictionShowapiResBody{

	var data : [TrafficRestrictionData]!
	var flag : Bool!
	var msg : String!
	var remark : String!
	var retCode : String!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		data = [TrafficRestrictionData]()
		if let dataArray = dictionary["data"] as? [NSDictionary]{
			for dic in dataArray{
				let value = TrafficRestrictionData(fromDictionary: dic)
				data.append(value)
			}
		}
		flag = dictionary["flag"] as? Bool
		msg = dictionary["msg"] as? String
		remark = dictionary["remark"] as? String
		retCode = dictionary["ret_code"] as? String
	}

}