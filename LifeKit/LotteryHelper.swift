//
//  LotteryHelper.swift
//  百宝箱
//
//  Created by 张文博 on 16/10/13.
//  Copyright © 2016年 张文博. All rights reserved.
//


import UIKit

public class LotteryHelper: NSObject {
    
    //获取最新开奖情况（参数：code：彩票类型 callback：成功获取数据后的操作）
    static func GetNewestLotteryList(code:String, callback:(newstlotterydata:NewestLotteryRootClass)->Void){
        let request = ShowApiRequest(url: "https://route.showapi.com/44-1", appId: AppInfo.appId, secret: AppInfo.secret)
        request.post(["code":code],  callback: { (data) -> Void in
            let newstlotteryinfo = NewestLotteryRootClass(fromDictionary: data)
            if(newstlotteryinfo.showapiResBody != nil)
            {
                callback(newstlotterydata: newstlotteryinfo)
            }
        })
    }
    
    static func GetNewestLotteryList(callback:(newstlotterydata:NewestLotteryRootClass)->Void){
        let request = ShowApiRequest(url: "https://route.showapi.com/44-1", appId: AppInfo.appId, secret: AppInfo.secret)
        request.post(callback: { (data) -> Void in
            let newstlotteryinfo = NewestLotteryRootClass(fromDictionary: data)
            if(newstlotteryinfo.showapiResBody != nil)
            {
                callback(newstlotterydata: newstlotteryinfo)
            }
        })
    }
    
    //获取多期开奖情况（参数：code：彩票类型 callback：成功获取数据后的操作）
    static func GetMutileLotteryList(code:String, callback:(mutilelotterydata:MutileLotteryRootClass)->Void){
        let request = ShowApiRequest(url: "https://route.showapi.com/44-2", appId: AppInfo.appId, secret: AppInfo.secret)
        request.post(["code":code],  callback: { (data) -> Void in
            let mutilelotteryinfo = MutileLotteryRootClass(fromDictionary: data)
            if(mutilelotteryinfo.showapiResBody != nil)
            {
                callback(mutilelotterydata: mutilelotteryinfo)
            }
        })
    }
    
    //获取多期开奖情况（参数：code：彩票类型 callback：成功获取数据后的操作）
    static func GetMutileLotteryList(code:String, endTime:String, callback:(mutilelotterydata:MutileLotteryRootClass)->Void){
        let request = ShowApiRequest(url: "https://route.showapi.com/44-2", appId: AppInfo.appId, secret: AppInfo.secret)
        request.post(["code":code,"endTime":endTime],  callback: { (data) -> Void in
            let mutilelotteryinfo = MutileLotteryRootClass(fromDictionary: data)
            if(mutilelotteryinfo.showapiResBody != nil)
            {
                callback(mutilelotterydata: mutilelotteryinfo)
            }
        })
    }
    
    //获取多期开奖情况（参数：code：彩票类型 callback：成功获取数据后的操作）
    static func GetMutileLotteryList(code:String, endTime:String, count:String, callback:(mutilelotterydata:MutileLotteryRootClass)->Void){
        let request = ShowApiRequest(url: "https://route.showapi.com/44-2", appId: AppInfo.appId, secret: AppInfo.secret)
        request.post(["code":code,"endTime":endTime,"count":count],  callback: { (data) -> Void in
            let mutilelotteryinfo = MutileLotteryRootClass(fromDictionary: data)
            if(mutilelotteryinfo.showapiResBody != nil)
            {
                callback(mutilelotterydata: mutilelotteryinfo)
            }
        })
    }
    
    //获取多期开奖情况（参数：code：彩票类型 callback：成功获取数据后的操作）
    static func GetSingleLotteryList(code:String, callback:(singlelotterydata:SingleLotteryRootClass)->Void){
        let request = ShowApiRequest(url: "https://route.showapi.com/44-3", appId: AppInfo.appId, secret: AppInfo.secret)
        request.post(["code":code],  callback: { (data) -> Void in
            let singlelotteryinfo = SingleLotteryRootClass(fromDictionary: data)
            if(singlelotteryinfo.showapiResBody != nil)
            {
                callback(singlelotterydata: singlelotteryinfo)
            }
        })
    }
    
    //获取多期开奖情况（参数：code：彩票类型 callback：成功获取数据后的操作）
    static func GetSingleLotteryList(code:String, expect:String, callback:(singlelotterydata:SingleLotteryRootClass)->Void){
        let request = ShowApiRequest(url: "https://route.showapi.com/44-3", appId: AppInfo.appId, secret: AppInfo.secret)
        request.post(["code":code,"expect":expect],  callback: { (data) -> Void in
            let singlelotteryinfo = SingleLotteryRootClass(fromDictionary: data)
            if(singlelotteryinfo.showapiResBody != nil)
            {
                callback(singlelotterydata: singlelotteryinfo)
            }
        })
    }
    
    static func GetLotteryTypeList(callback:(lotterytypelist:LotteryTypeRootClass)->Void){
        let request = ShowApiRequest(url: "https://route.showapi.com/44-6", appId: AppInfo.appId, secret: AppInfo.secret)
        request.post(callback: { (data) -> Void in
            let lotterytypelistinfo = LotteryTypeRootClass(fromDictionary: data)
            if(lotterytypelistinfo.showapiResBody != nil)
            {
                callback(lotterytypelist: lotterytypelistinfo)
            }
        })
    }
}
