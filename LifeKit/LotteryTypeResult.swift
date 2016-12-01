//
//	Result.swift
//
//	Create by Shine on 12/10/2016
//	Copyright © 2016. All rights reserved.
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class LotteryTypeResult{

	var area : String!              //地区
	var code : String!              //彩票代码
	var descr : String!             //描述
	var high : Bool!                //
	var hots : Bool!                //
	var issuer : String!            //
	var notes : String!             //
	var serdescr : String!          //
	var series : String!            //
	var tcode : String!             //
	var tdescr : String!            //
	var times : Int!                //


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		area = dictionary["area"] as? String
		code = dictionary["code"] as? String
		descr = dictionary["descr"] as? String
		high = dictionary["high"] as? Bool
		hots = dictionary["hots"] as? Bool
		issuer = dictionary["issuer"] as? String
		notes = dictionary["notes"] as? String
		serdescr = dictionary["serdescr"] as? String
		series = dictionary["series"] as? String
		tcode = dictionary["tcode"] as? String
		tdescr = dictionary["tdescr"] as? String
		times = dictionary["times"] as? Int
	}

}