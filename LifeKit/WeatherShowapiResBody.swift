//
//	ShowapiResBody.swift
//
//	Create by Shine on 25/7/2016
//	Copyright © 2016. All rights reserved.
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class WeatherShowapiResBody{

	var cityInfo : CityInfo!
	var f1 : F1!
	var f2 : F1!
	var f3 : F1!
	var now : Now!
	var retCode : Int!
	var time : String!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		if let cityInfoData = dictionary["cityInfo"] as? NSDictionary{
			cityInfo = CityInfo(fromDictionary: cityInfoData)
		}
		if let f1Data = dictionary["f1"] as? NSDictionary{
			f1 = F1(fromDictionary: f1Data)
		}
		if let f2Data = dictionary["f2"] as? NSDictionary{
			f2 = F1(fromDictionary: f2Data)
		}
		if let f3Data = dictionary["f3"] as? NSDictionary{
			f3 = F1(fromDictionary: f3Data)
		}
		if let nowData = dictionary["now"] as? NSDictionary{
			now = Now(fromDictionary: nowData)
		}
		retCode = dictionary["ret_code"] as? Int
		time = dictionary["time"] as? String
	}

}