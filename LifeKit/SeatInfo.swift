//
//	无座.swift
//
//	Create by Shine on 9/10/2016
//	Copyright © 2016. All rights reserved.
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class SeatInfo{

	var count : Int!
	var price : Float!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		count = dictionary["count"] as? Int
		price = dictionary["price"] as? Float
	}

}