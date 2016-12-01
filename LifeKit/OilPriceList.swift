//
//	List.swift
//
//	Create by Shine on 12/10/2016
//	Copyright © 2016. All rights reserved.
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class OilPriceList{

	var ct : String!        //时间
	var p0 : String!        //0号柴油
	var p90 : String!       //90号汽油
	var p93 : String!       //93号汽油
	var p97 : String!       //97号汽油
	var prov : String      //省份名称


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		ct = dictionary["ct"] as? String
		p0 = dictionary["p0"] as? String
		p90 = dictionary["p90"] as? String
		p93 = dictionary["p93"] as? String
		p97 = dictionary["p97"] as? String
		prov = (dictionary["prov"] as? String)!
	}

}