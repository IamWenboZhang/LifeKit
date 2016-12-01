//
//	F1.swift
//
//	Create by Shine on 25/7/2016
//	Copyright © 2016. All rights reserved.
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class F1 : NSObject, NSCoding{

	var airPress : String!                          //大气压
	var day : String!                               //当前日期
	var dayAirTemperature : String!                 //白天天气温度(摄氏度)
	var dayWeather : String!                        //白天天气
	var dayWeatherCode : String!                    //白天天气代码
	var dayWeatherPic : String!                     //白天天气图标
	var dayWindDirection : String!                  //白天风向编号
	var dayWindPower : String!                      //白天风力
	var jiangshui : String!                         //降水概率
	var nightAirTemperature : String!               //晚上天气温度(摄氏度)
	var nightWeather : String!                      //晚上天气
	var nightWeatherCode : String!                  //晚上天气代码
	var nightWeatherPic : String!                   //晚上天气图标
	var nightWindDirection : String!                //晚上风向
	var nightWindPower : String!                    //晚上风力
	var sunBeginEnd : String!                       //日出日落时间(中间用|分割)
	var weekday : Int!                              //星期几
	var ziwaixian : String!                         //紫外线


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		airPress = dictionary["air_press"] as? String
		day = dictionary["day"] as? String
		dayAirTemperature = dictionary["day_air_temperature"] as? String
		dayWeather = dictionary["day_weather"] as? String
		dayWeatherCode = dictionary["day_weather_code"] as? String
		dayWeatherPic = dictionary["day_weather_pic"] as? String
		dayWindDirection = dictionary["day_wind_direction"] as? String
		dayWindPower = dictionary["day_wind_power"] as? String
		jiangshui = dictionary["jiangshui"] as? String
		nightAirTemperature = dictionary["night_air_temperature"] as? String
		nightWeather = dictionary["night_weather"] as? String
		nightWeatherCode = dictionary["night_weather_code"] as? String
		nightWeatherPic = dictionary["night_weather_pic"] as? String
		nightWindDirection = dictionary["night_wind_direction"] as? String
		nightWindPower = dictionary["night_wind_power"] as? String
		sunBeginEnd = dictionary["sun_begin_end"] as? String
		weekday = dictionary["weekday"] as? Int
		ziwaixian = dictionary["ziwaixian"] as? String
	}

	/**
	 * 把所有属性值存到一个NSDictionary对象，键是相应的属性名。
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if airPress != nil{
			dictionary["air_press"] = airPress
		}
		if day != nil{
			dictionary["day"] = day
		}
		if dayAirTemperature != nil{
			dictionary["day_air_temperature"] = dayAirTemperature
		}
		if dayWeather != nil{
			dictionary["day_weather"] = dayWeather
		}
		if dayWeatherCode != nil{
			dictionary["day_weather_code"] = dayWeatherCode
		}
		if dayWeatherPic != nil{
			dictionary["day_weather_pic"] = dayWeatherPic
		}
		if dayWindDirection != nil{
			dictionary["day_wind_direction"] = dayWindDirection
		}
		if dayWindPower != nil{
			dictionary["day_wind_power"] = dayWindPower
		}
		if jiangshui != nil{
			dictionary["jiangshui"] = jiangshui
		}
		if nightAirTemperature != nil{
			dictionary["night_air_temperature"] = nightAirTemperature
		}
		if nightWeather != nil{
			dictionary["night_weather"] = nightWeather
		}
		if nightWeatherCode != nil{
			dictionary["night_weather_code"] = nightWeatherCode
		}
		if nightWeatherPic != nil{
			dictionary["night_weather_pic"] = nightWeatherPic
		}
		if nightWindDirection != nil{
			dictionary["night_wind_direction"] = nightWindDirection
		}
		if nightWindPower != nil{
			dictionary["night_wind_power"] = nightWindPower
		}
		if sunBeginEnd != nil{
			dictionary["sun_begin_end"] = sunBeginEnd
		}
		if weekday != nil{
			dictionary["weekday"] = weekday
		}
		if ziwaixian != nil{
			dictionary["ziwaixian"] = ziwaixian
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         airPress = aDecoder.decodeObjectForKey("air_press") as? String
         day = aDecoder.decodeObjectForKey("day") as? String
         dayAirTemperature = aDecoder.decodeObjectForKey("day_air_temperature") as? String
         dayWeather = aDecoder.decodeObjectForKey("day_weather") as? String
         dayWeatherCode = aDecoder.decodeObjectForKey("day_weather_code") as? String
         dayWeatherPic = aDecoder.decodeObjectForKey("day_weather_pic") as? String
         dayWindDirection = aDecoder.decodeObjectForKey("day_wind_direction") as? String
         dayWindPower = aDecoder.decodeObjectForKey("day_wind_power") as? String
         jiangshui = aDecoder.decodeObjectForKey("jiangshui") as? String
         nightAirTemperature = aDecoder.decodeObjectForKey("night_air_temperature") as? String
         nightWeather = aDecoder.decodeObjectForKey("night_weather") as? String
         nightWeatherCode = aDecoder.decodeObjectForKey("night_weather_code") as? String
         nightWeatherPic = aDecoder.decodeObjectForKey("night_weather_pic") as? String
         nightWindDirection = aDecoder.decodeObjectForKey("night_wind_direction") as? String
         nightWindPower = aDecoder.decodeObjectForKey("night_wind_power") as? String
         sunBeginEnd = aDecoder.decodeObjectForKey("sun_begin_end") as? String
         weekday = aDecoder.decodeObjectForKey("weekday") as? Int
         ziwaixian = aDecoder.decodeObjectForKey("ziwaixian") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder)
	{
		if airPress != nil{
			aCoder.encodeObject(airPress, forKey: "air_press")
		}
		if day != nil{
			aCoder.encodeObject(day, forKey: "day")
		}
		if dayAirTemperature != nil{
			aCoder.encodeObject(dayAirTemperature, forKey: "day_air_temperature")
		}
		if dayWeather != nil{
			aCoder.encodeObject(dayWeather, forKey: "day_weather")
		}
		if dayWeatherCode != nil{
			aCoder.encodeObject(dayWeatherCode, forKey: "day_weather_code")
		}
		if dayWeatherPic != nil{
			aCoder.encodeObject(dayWeatherPic, forKey: "day_weather_pic")
		}
		if dayWindDirection != nil{
			aCoder.encodeObject(dayWindDirection, forKey: "day_wind_direction")
		}
		if dayWindPower != nil{
			aCoder.encodeObject(dayWindPower, forKey: "day_wind_power")
		}
		if jiangshui != nil{
			aCoder.encodeObject(jiangshui, forKey: "jiangshui")
		}
		if nightAirTemperature != nil{
			aCoder.encodeObject(nightAirTemperature, forKey: "night_air_temperature")
		}
		if nightWeather != nil{
			aCoder.encodeObject(nightWeather, forKey: "night_weather")
		}
		if nightWeatherCode != nil{
			aCoder.encodeObject(nightWeatherCode, forKey: "night_weather_code")
		}
		if nightWeatherPic != nil{
			aCoder.encodeObject(nightWeatherPic, forKey: "night_weather_pic")
		}
		if nightWindDirection != nil{
			aCoder.encodeObject(nightWindDirection, forKey: "night_wind_direction")
		}
		if nightWindPower != nil{
			aCoder.encodeObject(nightWindPower, forKey: "night_wind_power")
		}
		if sunBeginEnd != nil{
			aCoder.encodeObject(sunBeginEnd, forKey: "sun_begin_end")
		}
		if weekday != nil{
			aCoder.encodeObject(weekday, forKey: "weekday")
		}
		if ziwaixian != nil{
			aCoder.encodeObject(ziwaixian, forKey: "ziwaixian")
		}

	}

}