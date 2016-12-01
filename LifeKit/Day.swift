//
//	Day.swift
//
//	Create by Shine on 8/11/2016
//	Copyright © 2016. All rights reserved.
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class Day{

	var dayNotice : String!
	var generalTxt : String!
	var grxz : String!
	var loveStar : Int!
	var loveTxt : String!
	var luckyColor : String!
	var luckyDirection : String!
	var luckyNum : String!
	var luckyTime : String!
	var moneyStar : Int!
	var moneyTxt : String!
	var summaryStar : Int!
	var time : String!
	var workStar : Int!
	var workTxt : String!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		dayNotice = dictionary["day_notice"] as? String
		generalTxt = dictionary["general_txt"] as? String
		grxz = dictionary["grxz"] as? String
		loveStar = dictionary["love_star"] as? Int
		loveTxt = dictionary["love_txt"] as? String
		luckyColor = dictionary["lucky_color"] as? String
		luckyDirection = dictionary["lucky_direction"] as? String
		luckyNum = dictionary["lucky_num"] as? String
		luckyTime = dictionary["lucky_time"] as? String
		moneyStar = dictionary["money_star"] as? Int
		moneyTxt = dictionary["money_txt"] as? String
		summaryStar = dictionary["summary_star"] as? Int
		time = dictionary["time"] as? String
		workStar = dictionary["work_star"] as? Int
		workTxt = dictionary["work_txt"] as? String
	}

}