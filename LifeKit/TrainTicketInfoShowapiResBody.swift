//
//	ShowapiResBody.swift
//
//	Create by Shine on 9/10/2016
//	Copyright © 2016. All rights reserved.
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class TrainTicketInfoShowapiResBody{

	var arrCity : String!
	var data : [TrainTicketInfoData]!
	var descriptionField : String!
	var dptCity : String!
	var dptDate : String!
	var errorCode : String!
	var errorDescription : String!
	var retCode : String!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		arrCity = dictionary["arrCity"] as? String
		data = [TrainTicketInfoData]()
		if let dataArray = dictionary["data"] as? [NSDictionary]{
			for dic in dataArray{
				let value = TrainTicketInfoData(fromDictionary: dic)
				data.append(value)
			}
		}
		descriptionField = dictionary["description"] as? String
		dptCity = dictionary["dptCity"] as? String
		dptDate = dictionary["dptDate"] as? String
		errorCode = dictionary["error_code"] as? String
		errorDescription = dictionary["error_description"] as? String
		retCode = dictionary["ret_code"] as? String
	}

}