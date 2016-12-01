//
//	ShowapiResBody.swift
//
//	Create by Shine on 29/11/2016
//	Copyright © 2016. All rights reserved.
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class KuaiDiShowapiResBody{

	var com : String!
	var comZh : String!
	var data : [KuaiDiData]!
	var errorCode : String!
	var errorDescription : String!
	var ischeck : String!
	var nu : String!
	var retCode : String!
	var state : String!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		com = dictionary["com"] as? String
		comZh = dictionary["com_zh"] as? String
		data = [KuaiDiData]()
		if let dataArray = dictionary["data"] as? [NSDictionary]{
			for dic in dataArray{
				let value = KuaiDiData(fromDictionary: dic)
				data.append(value)
			}
		}
		errorCode = dictionary["error_code"] as? String
		errorDescription = dictionary["error_description"] as? String
		ischeck = dictionary["ischeck"] as? String
		nu = dictionary["nu"] as? String
		retCode = dictionary["ret_code"] as? String
		state = dictionary["state"] as? String
	}

}