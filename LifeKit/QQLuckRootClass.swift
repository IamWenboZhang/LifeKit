//
//	QQLuckRootClass.swift
//
//	Create by Shine on 6/12/2016
//	Copyright © 2016. All rights reserved.
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class QQLuckRootClass : NSObject, NSCoding{

	var showapiResBody : QQLuckShowapiResBody!
	var showapiResCode : Int!
	var showapiResError : String!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		if let showapiResBodyData = dictionary["showapi_res_body"] as? NSDictionary{
			showapiResBody = QQLuckShowapiResBody(fromDictionary: showapiResBodyData)
		}
		showapiResCode = dictionary["showapi_res_code"] as? Int
		showapiResError = dictionary["showapi_res_error"] as? String
	}

	/**
	 * 把所有属性值存到一个NSDictionary对象，键是相应的属性名。
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if showapiResBody != nil{
			dictionary["showapi_res_body"] = showapiResBody.toDictionary()
		}
		if showapiResCode != nil{
			dictionary["showapi_res_code"] = showapiResCode
		}
		if showapiResError != nil{
			dictionary["showapi_res_error"] = showapiResError
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         showapiResBody = aDecoder.decodeObjectForKey("showapi_res_body") as? QQLuckShowapiResBody
         showapiResCode = aDecoder.decodeObjectForKey("showapi_res_code") as? Int
         showapiResError = aDecoder.decodeObjectForKey("showapi_res_error") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder)
	{
		if showapiResBody != nil{
			aCoder.encodeObject(showapiResBody, forKey: "showapi_res_body")
		}
		if showapiResCode != nil{
			aCoder.encodeObject(showapiResCode, forKey: "showapi_res_code")
		}
		if showapiResError != nil{
			aCoder.encodeObject(showapiResError, forKey: "showapi_res_error")
		}

	}

}