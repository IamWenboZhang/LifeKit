//
//  WeatherHelper.swift
//  LifeKit
//
//  Created by 张文博 on 16/11/4.
//  Copyright © 2016年 张文博. All rights reserved.
//
import UIKit

public class LifeHelper: NSObject {

    static func GetWeather(cityName:String,callback:(weatherdata:WeatherRootClass)->Void){
        let request = ShowApiRequest(url: "https://route.showapi.com/9-2", appId: AppInfo.appId, secret: AppInfo.secret)
        request.post(["area":cityName],  callback: { (data) -> Void in
            let weatherinfo = WeatherRootClass(fromDictionary: data)
            if(weatherinfo.showapiResBody != nil)
            {
                if(weatherinfo.showapiResCode == 0)
                {
                    callback(weatherdata: weatherinfo)
                }
            }
        })
    }
    
    static func GetKuaiDi(kuaidino:String,callback:(kuaididata:KuaiDiRootClass)->Void){
        let request = ShowApiRequest(url: "https://route.showapi.com/880-1", appId: AppInfo.appId, secret: AppInfo.secret)
        request.post(["nu":kuaidino],  callback: { (data) -> Void in
            let kuaidiinfo = KuaiDiRootClass(fromDictionary: data)
            if(kuaidiinfo.showapiResBody != nil)
            {
                if(kuaidiinfo.showapiResCode == 0)
                {
                    callback(kuaididata: kuaidiinfo)
                }
            }
        })
    }
    
    static func GetHuiLvHQ(callback:(huilvHQdata:HuiLvHQRootClass)->Void){
        let request = ShowApiRequest(url: "https://route.showapi.com/105-30", appId: AppInfo.appId, secret: AppInfo.secret)
        request.post(callback: { (data) -> Void in
            let huilvHQ = HuiLvHQRootClass(fromDictionary: data)
            if(huilvHQ.showapiResBody != nil)
            {
                if(huilvHQ.showapiResCode == 0)
                {
                    callback(huilvHQdata: huilvHQ)
                }
            }
        })
    }
    
    static func GetHuiLvCalc(fromCode:String,toCode:String,money:String,callback:(calcdata:HuiLvRootClass)->Void){
        let request = ShowApiRequest(url: "https://route.showapi.com/880-1", appId: AppInfo.appId, secret: AppInfo.secret)
        request.post(["fromCode":fromCode,"toCode":toCode,"money":money],  callback: { (data) -> Void in
            let calcinfo = HuiLvRootClass(fromDictionary: data)
            if(calcinfo.showapiResBody != nil)
            {
                if(calcinfo.showapiResCode == 0)
                {
                    callback(calcdata: calcinfo)
                }
            }
        })
    }
    
    static func GetConstellationLuck(constellation:String,callback:(constellationdata:ConstellationRootClass)->Void){
        let pinyinConstellation = LifeHelper.WenZiToPinYin_Constellation(constellation)
        let request = ShowApiRequest(url: "https://route.showapi.com/872-1", appId: AppInfo.appId, secret: AppInfo.secret)
        request.post(["star":pinyinConstellation],  callback: { (data) -> Void in
            let constellationinfo = ConstellationRootClass(fromDictionary: data)
            if(constellationinfo.showapiResBody != nil)
            {
                if(constellationinfo.showapiResCode == 0)
                {
                    callback(constellationdata: constellationinfo)
                }
            }
            
        })
    }
    
    static func PinYinToWenZi_Consellation(pinyin:String)->String{
        var result = ""
        switch pinyin {
        case "shuiping":
            result = "水瓶座"
        case "tianxie":
            result = "天蝎座"
        case "tiancheng":
            result = "天秤座"
        case "baiyang":
            result = "白羊座"
        case "jinniu":
            result = "金牛座"
        case "shuangzi":
            result = "双子座"
        case "shuangyu":
            result = "双鱼座"
        case "chunv":
            result = "处女座"
        case "mojie":
            result = "摩羯座"
        case "shizi":
            result = "狮子座"
        case "sheshou":
            result = "射手座"
        case "juxie":
            result = "巨蟹座"
        default:
            result = ""
        }
        return result
    }
    
    static func WenZiToPinYin_Constellation(wenzi:String)->String{
        var result = ""
        switch wenzi {
        case "水瓶座":
            result = "shuiping"
        case "天蝎座":
            result = "tianxie"
        case "天秤座":
            result = "tiancheng"
        case "白羊座":
            result = "baiyang"
        case "金牛座":
            result = "jinniu"
        case "双子座":
            result = "shuangzi"
        case "双鱼座":
            result = "shuangyu"
        case "处女座":
            result = "chunv"
        case "摩羯座":
            result = "mojie"
        case "狮子座":
            result = "shizi"
        case "射手座":
            result = "sheshou"
        case "巨蟹座":
            result = "juxie"
        default:
            result = ""
        }
        return result
    }
    
    static func intToWeekDayStr(weekday: Int) -> String {
        var result = ""
        switch weekday {
        case 0:
            result = "周日"
        case 1:
            result = "周一"
        case 2:
            result = "周二"
        case 3:
            result = "周三"
        case 4:
            result = "周四"
        case 5:
            result = "周五"
        case 6:
            result = "周六"
        case 7:
            result = "周日"
        default:
            result = ""
        }
        return result
    }
}