//
//	ShowapiResBody.swift
//
//	Create by Shine on 9/10/2016
//	Copyright © 2016. All rights reserved.
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class TrainTimeListShowapiResBody{

	var allmile : String!
	var data : [TrainTimeListData]!
	var endStation : String!
	var endTime : String!
	var errorCode : String!
	var errorDescription : String!
	var retCode : String!
	var startStation : String!
	var startTime : String!
	var timeAll : String!
	var trainType : String!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		allmile = dictionary["allmile"] as? String
		data = [TrainTimeListData]()
		if let dataArray = dictionary["data"] as? [NSDictionary]{
			for dic in dataArray{
				let value = TrainTimeListData(fromDictionary: dic)
				data.append(value)
			}
		}
		endStation = dictionary["end_station"] as? String
		endTime = dictionary["end_time"] as? String
		errorCode = dictionary["error_code"] as? String
		errorDescription = dictionary["error_description"] as? String
		retCode = dictionary["ret_code"] as? String
		startStation = dictionary["start_station"] as? String
		startTime = dictionary["start_time"] as? String
		timeAll = dictionary["time_all"] as? String
		trainType = dictionary["train_type"] as? String
	}

}