//
//  TrainDataSource.swift
//  百宝箱
//
//  Created by 张文博 on 16/10/10.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

public class TrainHelper: NSObject {
    //获取列车时刻表信息（参数：train_num：列车号 callback：成功获取数据后的操作）
    static func GetTrainTimeList(train_num:String, callback:(traintimelist:TrainTimeListRootClass)->Void){
        let request = ShowApiRequest(url: "https://route.showapi.com/832-2", appId: AppInfo.appId, secret: AppInfo.secret)
        request.post(["train_num":train_num],  callback: { (data) -> Void in
            let triantimelistinfo = TrainTimeListRootClass(fromDictionary: data)
            if(triantimelistinfo.showapiResBody != nil)
            {
                callback(traintimelist: triantimelistinfo)
            }
        })
    }
    
    //获取列车时刻表信息（参数：from：起点  to:终点   date:发车日期  callback：成功获取数据后的操作）
    static func GetTrainTicketList(from:String,to:String,date:String,callback:(trainticketinfo:TrainTicketInfoRootClass)->Void){
        let request = ShowApiRequest(url: "https://route.showapi.com/832-3", appId: AppInfo.appId, secret: AppInfo.secret)
        request.post(["from":from,"to":to,"date":date],  callback: { (data) -> Void in
            let trainticketdata = TrainTicketInfoRootClass(fromDictionary: data)
            if(trainticketdata.showapiResBody != nil)
            {
                callback(trainticketinfo: trainticketdata)
            }
        })
    }
}