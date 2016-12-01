//
//	RootClass.swift
//
//	Create by Shine on 29/11/2016
//	Copyright © 2016. All rights reserved.
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class KuaiDiRootClass{

	var showapiResBody : KuaiDiShowapiResBody!
	var showapiResCode : Int!
	var showapiResError : String!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		if let showapiResBodyData = dictionary["showapi_res_body"] as? NSDictionary{
			showapiResBody = KuaiDiShowapiResBody(fromDictionary: showapiResBodyData)
		}
		showapiResCode = dictionary["showapi_res_code"] as? Int
		showapiResError = dictionary["showapi_res_error"] as? String
	}

}