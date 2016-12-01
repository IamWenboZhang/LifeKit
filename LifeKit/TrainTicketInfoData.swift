//
//	Data.swift
//
//	Create by Shine on 9/10/2016
//	Copyright © 2016. All rights reserved.
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class TrainTicketInfoData{

	var arrStationName : String!                        //到达站点名称
	var arrStationNo : String!                          //到达站点编号
	var arrTime : String!                               //到达时间
	var dayDifference : String!                         //日期偏差？
	var dptStationName : String!                        //发车站点名称
	var dptStationNo : String!                          //发车站点编号
	var dptTime : String!                               //发车时间
	var endStationName : String!                        //终点站名称
	var interval : String!                              //历时时间
	var intervalMiles : Int!                            //行驶里程
	var lishiValue : String!                            //历史值
	var seats : TrainTicketInfoSeat!                    //车票信息
	var startStationName : String!                      //起始站点名称
	var trainNo : String!                               //车次
	var trainType : String!                             //列车类型


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		arrStationName = dictionary["arrStationName"] as? String
		arrStationNo = dictionary["arrStationNo"] as? String
		arrTime = dictionary["arrTime"] as? String
		dayDifference = dictionary["dayDifference"] as? String
		dptStationName = dictionary["dptStationName"] as? String
		dptStationNo = dictionary["dptStationNo"] as? String
		dptTime = dictionary["dptTime"] as? String
		endStationName = dictionary["endStationName"] as? String
		interval = dictionary["interval"] as? String
		intervalMiles = dictionary["intervalMiles"] as? Int
		lishiValue = dictionary["lishiValue"] as? String
		if let seatsData = dictionary["seats"] as? NSDictionary{
			seats = TrainTicketInfoSeat(fromDictionary: seatsData)
		}
		startStationName = dictionary["startStationName"] as? String
		trainNo = dictionary["trainNo"] as? String
		trainType = dictionary["trainType"] as? String
	}

}