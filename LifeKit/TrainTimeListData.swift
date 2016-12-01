//
//	Data.swift
//
//	Create by Shine on 9/10/2016
//	Copyright © 2016. All rights reserved.
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class TrainTimeListData{

	var arriveTime : String!            //到站时间
	var day : String!                   //日期
	var leaveTime : String!             //离站时间
	var num : Int!                      //第几站
	var stationName : String!           //站点名称


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		arriveTime = dictionary["arrive_time"] as? String
		day = dictionary["day"] as? String
		leaveTime = dictionary["leave_time"] as? String
		num = dictionary["num"] as? Int
		stationName = dictionary["station_name"] as? String
	}

}