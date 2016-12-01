//
//  CarHelper.swift
//  LifeKit
//
//  Created by 张文博 on 16/11/26.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class CarHelper: NSObject {

    
    //获取某个地区今日油价信息（参数：prov：地区 callback：成功获取数据后的操作）
    static func GetOilPriceList(prov:String, callback:(oilpricelist:OilPriceRootClass)->Void){
        let request = ShowApiRequest(url: "https://route.showapi.com/138-46", appId: AppInfo.appId, secret: AppInfo.secret)
        request.post(["prov":prov],  callback: { (data) -> Void in
            let oilpricelistinfo = OilPriceRootClass(fromDictionary: data)
            if(oilpricelistinfo.showapiResBody != nil)
            {
                callback(oilpricelist: oilpricelistinfo)
            }
        })
    }
    
    //获取所有今日油价信息（callback：成功获取数据后的操作）
    static func GetOilPriceList(callback:(oilpricelist:OilPriceRootClass)->Void){
        let request = ShowApiRequest(url: "https://route.showapi.com/138-46", appId: AppInfo.appId, secret: AppInfo.secret)
        request.post(nil,  callback: { (data) -> Void in
            let oilpricelistinfo = OilPriceRootClass(fromDictionary: data)
            if(oilpricelistinfo.showapiResBody != nil)
            {
                callback(oilpricelist: oilpricelistinfo)
            }
        })
    }
    
    //获取某个地区限行信息（参数：areaName：地区 callback：成功获取数据后的操作）
    static func GetTrafficRestrictionInfo(areaName:String, callback:(TrafficRestrictionInfo:TrafficRestrictionRootClass)->Void){
        let request = ShowApiRequest(url: "https://route.showapi.com/841-1", appId: AppInfo.appId, secret: AppInfo.secret)
        request.post(["areaName":areaName],  callback: { (data) -> Void in
            let trafficrestrictioninfo = TrafficRestrictionRootClass(fromDictionary: data)
            if(trafficrestrictioninfo.showapiResBody != nil)
            {
                callback(TrafficRestrictionInfo: trafficrestrictioninfo)
            }
        })
    }
    
    //获取某个地区某个车型的限行信息（参数：areaName：地区 carConType:车辆类型 callback：成功获取数据后的操作）
    static func GetTrafficRestrictionInfo(areaName:String,carConType:Int,callback:(TrafficRestrictionInfo:TrafficRestrictionRootClass)->Void){
        let request = ShowApiRequest(url: "https://route.showapi.com/841-1", appId: AppInfo.appId, secret: AppInfo.secret)
        request.post(["areaName":areaName,"carConType":carConType],  callback: { (data) -> Void in
            let trafficrestrictioninfo = TrafficRestrictionRootClass(fromDictionary: data)
            if(trafficrestrictioninfo.showapiResBody != nil)
            {
                callback(TrafficRestrictionInfo: trafficrestrictioninfo)
            }
        })
    }

}
