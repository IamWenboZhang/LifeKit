//
//	Data.swift
//
//	Create by Shine on 12/10/2016
//	Copyright © 2016. All rights reserved.
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class TrafficRestrictionData{

	var areaName : String!                  //限行的城市名
	var begDate : String!                   //限行有效期开始时间
	var carConType : Int!                   //区域限制类型 1 本地 2外地 3本地和外地
	var confineWay : String!                //限行方式 :按日期限行\按星期限行\按天数限行\按时间段限行
	var descriptionField : String!          //限行相关信息的描述
	var endDate : String!                   //限行有效期结束时间
	var id : Int!                           //标识
	var img : String!                       //限行示意图
	var preCarNum : String!                 //车牌前缀 如:京
	var punish : String!                    //处罚信息 如:罚100块，扣三分
	var status : Int!                       //状态 1 有效 0无效


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		areaName = dictionary["areaName"] as? String
		begDate = dictionary["begDate"] as? String
		carConType = dictionary["carConType"] as? Int
		confineWay = dictionary["confineWay"] as? String
		descriptionField = dictionary["description"] as? String
		endDate = dictionary["endDate"] as? String
		id = dictionary["id"] as? Int
		img = dictionary["img"] as? String
		preCarNum = dictionary["preCarNum"] as? String
		punish = dictionary["punish"] as? String
		status = dictionary["status"] as? Int
	}

}