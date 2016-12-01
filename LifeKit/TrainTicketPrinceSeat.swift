//
//	Seat.swift
//
//	Create by Shine on 9/10/2016
//	Copyright © 2016. All rights reserved.
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class TrainTicketInfoSeat{

	var 无座 : SeatInfo!
	var 硬卧 : SeatInfo!
	var 硬座 : SeatInfo!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		if let 无座Data = dictionary["无座"] as? NSDictionary{
			无座 = SeatInfo(fromDictionary: 无座Data)
		}
		if let 硬卧Data = dictionary["硬卧"] as? NSDictionary{
			硬卧 = SeatInfo(fromDictionary: 硬卧Data)
		}
		if let 硬座Data = dictionary["硬座"] as? NSDictionary{
			硬座 = SeatInfo(fromDictionary: 硬座Data)
		}
	}

}