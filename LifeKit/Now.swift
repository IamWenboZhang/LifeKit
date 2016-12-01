//
//	Now.swift
//
//	Create by Shine on 25/7/2016
//	Copyright © 2016. All rights reserved.
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class Now{

	var aqi : Int!                                      //空气指数，越小越好
	var aqiDetail : AqiDetail!                          //aqi明细数据
	var sd : String!                                    //空气湿度
	var temperature : String!                           //气温
	var temperatureTime : String!                       //获得气温的时间
	var weather : String!                               //天气
	var weatherCode : String!                           //天气代码
	var weatherPic : String!                            //天气小图标
	var windDirection : String!                         //风向
	var windPower : String!                             //风力


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		aqi = dictionary["aqi"] as? Int
		if let aqiDetailData = dictionary["aqiDetail"] as? NSDictionary{
			aqiDetail = AqiDetail(fromDictionary: aqiDetailData)
		}
		sd = dictionary["sd"] as? String
		temperature = dictionary["temperature"] as? String
		temperatureTime = dictionary["temperature_time"] as? String
		weather = dictionary["weather"] as? String
		weatherCode = dictionary["weather_code"] as? String
		weatherPic = dictionary["weather_pic"] as? String
		windDirection = dictionary["wind_direction"] as? String
		windPower = dictionary["wind_power"] as? String
	}

}