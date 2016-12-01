//
//	CityInfo.swift
//
//	Create by Shine on 25/7/2016
//	Copyright © 2016. All rights reserved.
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CityInfo : NSObject, NSCoding{

	var c1 : String!                    //区域id
	var c10 : String!                   //城市级别
	var c11 : String!                   //城市区号
	var c12 : String!                   //邮编
	var c15 : String!                   //海拔
	var c16 : String!                   //雷达站号
	var c17 : String!                   //
	var c2 : String!                    //城市英文名
	var c3 : String!                    //城市中文名
	var c4 : String!                    //城市所在市英文名
	var c5 : String!                    //城市所在市中文名
	var c6 : String!                    //城市所在省英文名
	var c7 : String!                    //城市所在省中文名
	var c8 : String!                    //城市所在国家英文名
	var c9 : String!                    //城市所在国家中文名
	var latitude : Float!               //纬度
	var longitude : Float!              //经度


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		c1 = dictionary["c1"] as? String
		c10 = dictionary["c10"] as? String
		c11 = dictionary["c11"] as? String
		c12 = dictionary["c12"] as? String
		c15 = dictionary["c15"] as? String
		c16 = dictionary["c16"] as? String
		c17 = dictionary["c17"] as? String
		c2 = dictionary["c2"] as? String
		c3 = dictionary["c3"] as? String
		c4 = dictionary["c4"] as? String
		c5 = dictionary["c5"] as? String
		c6 = dictionary["c6"] as? String
		c7 = dictionary["c7"] as? String
		c8 = dictionary["c8"] as? String
		c9 = dictionary["c9"] as? String
		latitude = dictionary["latitude"] as? Float
		longitude = dictionary["longitude"] as? Float
	}

	/**
	 * 把所有属性值存到一个NSDictionary对象，键是相应的属性名。
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if c1 != nil{
			dictionary["c1"] = c1
		}
		if c10 != nil{
			dictionary["c10"] = c10
		}
		if c11 != nil{
			dictionary["c11"] = c11
		}
		if c12 != nil{
			dictionary["c12"] = c12
		}
		if c15 != nil{
			dictionary["c15"] = c15
		}
		if c16 != nil{
			dictionary["c16"] = c16
		}
		if c17 != nil{
			dictionary["c17"] = c17
		}
		if c2 != nil{
			dictionary["c2"] = c2
		}
		if c3 != nil{
			dictionary["c3"] = c3
		}
		if c4 != nil{
			dictionary["c4"] = c4
		}
		if c5 != nil{
			dictionary["c5"] = c5
		}
		if c6 != nil{
			dictionary["c6"] = c6
		}
		if c7 != nil{
			dictionary["c7"] = c7
		}
		if c8 != nil{
			dictionary["c8"] = c8
		}
		if c9 != nil{
			dictionary["c9"] = c9
		}
		if latitude != nil{
			dictionary["latitude"] = latitude
		}
		if longitude != nil{
			dictionary["longitude"] = longitude
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         c1 = aDecoder.decodeObjectForKey("c1") as? String
         c10 = aDecoder.decodeObjectForKey("c10") as? String
         c11 = aDecoder.decodeObjectForKey("c11") as? String
         c12 = aDecoder.decodeObjectForKey("c12") as? String
         c15 = aDecoder.decodeObjectForKey("c15") as? String
         c16 = aDecoder.decodeObjectForKey("c16") as? String
         c17 = aDecoder.decodeObjectForKey("c17") as? String
         c2 = aDecoder.decodeObjectForKey("c2") as? String
         c3 = aDecoder.decodeObjectForKey("c3") as? String
         c4 = aDecoder.decodeObjectForKey("c4") as? String
         c5 = aDecoder.decodeObjectForKey("c5") as? String
         c6 = aDecoder.decodeObjectForKey("c6") as? String
         c7 = aDecoder.decodeObjectForKey("c7") as? String
         c8 = aDecoder.decodeObjectForKey("c8") as? String
         c9 = aDecoder.decodeObjectForKey("c9") as? String
         latitude = aDecoder.decodeObjectForKey("latitude") as? Float
         longitude = aDecoder.decodeObjectForKey("longitude") as? Float

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder)
	{
		if c1 != nil{
			aCoder.encodeObject(c1, forKey: "c1")
		}
		if c10 != nil{
			aCoder.encodeObject(c10, forKey: "c10")
		}
		if c11 != nil{
			aCoder.encodeObject(c11, forKey: "c11")
		}
		if c12 != nil{
			aCoder.encodeObject(c12, forKey: "c12")
		}
		if c15 != nil{
			aCoder.encodeObject(c15, forKey: "c15")
		}
		if c16 != nil{
			aCoder.encodeObject(c16, forKey: "c16")
		}
		if c17 != nil{
			aCoder.encodeObject(c17, forKey: "c17")
		}
		if c2 != nil{
			aCoder.encodeObject(c2, forKey: "c2")
		}
		if c3 != nil{
			aCoder.encodeObject(c3, forKey: "c3")
		}
		if c4 != nil{
			aCoder.encodeObject(c4, forKey: "c4")
		}
		if c5 != nil{
			aCoder.encodeObject(c5, forKey: "c5")
		}
		if c6 != nil{
			aCoder.encodeObject(c6, forKey: "c6")
		}
		if c7 != nil{
			aCoder.encodeObject(c7, forKey: "c7")
		}
		if c8 != nil{
			aCoder.encodeObject(c8, forKey: "c8")
		}
		if c9 != nil{
			aCoder.encodeObject(c9, forKey: "c9")
		}
		if latitude != nil{
			aCoder.encodeObject(latitude, forKey: "latitude")
		}
		if longitude != nil{
			aCoder.encodeObject(longitude, forKey: "longitude")
		}

	}

}