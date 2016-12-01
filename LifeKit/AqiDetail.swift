//
//	AqiDetail.swift
//
//	Create by Shine on 25/7/2016
//	Copyright © 2016. All rights reserved.
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class AqiDetail : NSObject, NSCoding{

	var aqi : Int!                                          //空气质量指数，越小越好
	var area : String!                                      //地区
	var areaCode : String!                                  //区域代码
	var co : Float!                                         //一氧化碳1小时平均
	var no2 : Int!                                          //二氧化氮1小时平均
	var o3 : Int!                                           //臭氧1小时平均
	var o38h : Int!                                         //臭氧8小时平均
	var pm10 : Int!                                         //颗粒物（粒径小于等于10μm）1小时平均
	var pm25 : Int!                                         //颗粒物（粒径小于等于2.5μm）1小时平均
	var primaryPollutant : String!                          //首要污染物
	var quality : String!                               //空气质量指数类别，有“优、良、轻度污染、中度污染、重度污染、严重污染”6类
	var so2 : Int!                                          //二氧化硫1小时平均


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		aqi = dictionary["aqi"] as? Int
		area = dictionary["area"] as? String
		areaCode = dictionary["area_code"] as? String
		co = dictionary["co"] as? Float
		no2 = dictionary["no2"] as? Int
		o3 = dictionary["o3"] as? Int
		o38h = dictionary["o3_8h"] as? Int
		pm10 = dictionary["pm10"] as? Int
		pm25 = dictionary["pm2_5"] as? Int
		primaryPollutant = dictionary["primary_pollutant"] as? String
		quality = dictionary["quality"] as? String
		so2 = dictionary["so2"] as? Int
	}

	/**
	 * 把所有属性值存到一个NSDictionary对象，键是相应的属性名。
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if aqi != nil{
			dictionary["aqi"] = aqi
		}
		if area != nil{
			dictionary["area"] = area
		}
		if areaCode != nil{
			dictionary["area_code"] = areaCode
		}
		if co != nil{
			dictionary["co"] = co
		}
		if no2 != nil{
			dictionary["no2"] = no2
		}
		if o3 != nil{
			dictionary["o3"] = o3
		}
		if o38h != nil{
			dictionary["o3_8h"] = o38h
		}
		if pm10 != nil{
			dictionary["pm10"] = pm10
		}
		if pm25 != nil{
			dictionary["pm2_5"] = pm25
		}
		if primaryPollutant != nil{
			dictionary["primary_pollutant"] = primaryPollutant
		}
		if quality != nil{
			dictionary["quality"] = quality
		}
		if so2 != nil{
			dictionary["so2"] = so2
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         aqi = aDecoder.decodeObjectForKey("aqi") as? Int
         area = aDecoder.decodeObjectForKey("area") as? String
         areaCode = aDecoder.decodeObjectForKey("area_code") as? String
         co = aDecoder.decodeObjectForKey("co") as? Float
         no2 = aDecoder.decodeObjectForKey("no2") as? Int
         o3 = aDecoder.decodeObjectForKey("o3") as? Int
         o38h = aDecoder.decodeObjectForKey("o3_8h") as? Int
         pm10 = aDecoder.decodeObjectForKey("pm10") as? Int
         pm25 = aDecoder.decodeObjectForKey("pm2_5") as? Int
         primaryPollutant = aDecoder.decodeObjectForKey("primary_pollutant") as? String
         quality = aDecoder.decodeObjectForKey("quality") as? String
         so2 = aDecoder.decodeObjectForKey("so2") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder)
	{
		if aqi != nil{
			aCoder.encodeObject(aqi, forKey: "aqi")
		}
		if area != nil{
			aCoder.encodeObject(area, forKey: "area")
		}
		if areaCode != nil{
			aCoder.encodeObject(areaCode, forKey: "area_code")
		}
		if co != nil{
			aCoder.encodeObject(co, forKey: "co")
		}
		if no2 != nil{
			aCoder.encodeObject(no2, forKey: "no2")
		}
		if o3 != nil{
			aCoder.encodeObject(o3, forKey: "o3")
		}
		if o38h != nil{
			aCoder.encodeObject(o38h, forKey: "o3_8h")
		}
		if pm10 != nil{
			aCoder.encodeObject(pm10, forKey: "pm10")
		}
		if pm25 != nil{
			aCoder.encodeObject(pm25, forKey: "pm2_5")
		}
		if primaryPollutant != nil{
			aCoder.encodeObject(primaryPollutant, forKey: "primary_pollutant")
		}
		if quality != nil{
			aCoder.encodeObject(quality, forKey: "quality")
		}
		if so2 != nil{
			aCoder.encodeObject(so2, forKey: "so2")
		}

	}

}