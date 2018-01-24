//
//	QQLuckShowapiResBody.swift
//
//	Create by Shine on 6/12/2016
//	Copyright © 2016. All rights reserved.
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class QQLuckShowapiResBody : NSObject, NSCoding{

	var analysis : String!
	var desc : String!
	var grade : String!
	var retCode : Int!
	var score : String!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		analysis = dictionary["analysis"] as? String
		desc = dictionary["desc"] as? String
		grade = dictionary["grade"] as? String
		retCode = dictionary["ret_code"] as? Int
		score = dictionary["score"] as? String
	}

	/**
	 * 把所有属性值存到一个NSDictionary对象，键是相应的属性名。
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if analysis != nil{
			dictionary["analysis"] = analysis
		}
		if desc != nil{
			dictionary["desc"] = desc
		}
		if grade != nil{
			dictionary["grade"] = grade
		}
		if retCode != nil{
			dictionary["ret_code"] = retCode
		}
		if score != nil{
			dictionary["score"] = score
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         analysis = aDecoder.decodeObjectForKey("analysis") as? String
         desc = aDecoder.decodeObjectForKey("desc") as? String
         grade = aDecoder.decodeObjectForKey("grade") as? String
         retCode = aDecoder.decodeObjectForKey("ret_code") as? Int
         score = aDecoder.decodeObjectForKey("score") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder)
	{
		if analysis != nil{
			aCoder.encodeObject(analysis, forKey: "analysis")
		}
		if desc != nil{
			aCoder.encodeObject(desc, forKey: "desc")
		}
		if grade != nil{
			aCoder.encodeObject(grade, forKey: "grade")
		}
		if retCode != nil{
			aCoder.encodeObject(retCode, forKey: "ret_code")
		}
		if score != nil{
			aCoder.encodeObject(score, forKey: "score")
		}

	}

}