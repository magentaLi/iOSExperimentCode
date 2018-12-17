//IOS实验三 2016110423_李嘉坤

import UIKit

//1.显示当前准确的中文时间，包括北京、东京、纽约、伦敦，格式为（2016年9月28日星期三 上午10:25）
var now = Date()
var formmatter = DateFormatter()
formmatter.dateFormat = "yyyy年MM月dd日EEEE aaa hh:mm"
var beijingTime = formmatter.string(from: now)
print("北京时间：" + beijingTime)

formmatter.timeZone = TimeZone(secondsFromGMT: 3600*9)
var dongjingTime = formmatter.string(from: now)
print("东京时间：" + dongjingTime)

formmatter.timeZone = TimeZone.init(secondsFromGMT: 3600*0)
var londonTime = formmatter.string(from: now)
print("伦敦时间：" + londonTime)

formmatter.timeZone = TimeZone.init(secondsFromGMT: 3600 * -5)
var newYorkTime = formmatter.string(from: now)
print("纽约时间：" + newYorkTime)


//2.字符串处理
var str = "Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS."
//b)返回字符串从第6个字符到第20个字符的子串；
var startIndex = str.index(str.startIndex, offsetBy: 5)
var endIndex = str.index(str.startIndex, offsetBy: 20)
var res1 = str[startIndex...endIndex]
print(res1)
//c)删除其中所有的OS字符;
var res2 = str.replacingOccurrences(of: "OS", with: "")
print(res2)

//3.将1、2题的时间和字符串存入一个字典中，并存入沙盒中的Document某文件中；
var myDictionaries = ["beijingTime":beijingTime,"dongjingTime":dongjingTime,"londunTime":londonTime,"newYorkTime":newYorkTime,"str":str]

// 1、获得沙盒的根路径
let home = NSHomeDirectory() as NSString
// 2、获得Documents路径，使用NSString对象的stringByAppendingPathComponent()方法拼接路径
let docPath = home.appendingPathComponent("Documents") as NSString;
// 3.获得文件路径
let filePath = docPath.appendingPathComponent("data.plist")
print("存储字典的沙盒文件路径为：\n\(filePath)")
let data = myDictionaries as NSDictionary
data.write(toFile: filePath, atomically: true)

//4.从网上下载一张照片并保存到本地沙盒的Document的某文件中；
let imagePath = docPath.appendingPathComponent("myImage.jpg")

let imageUrl = URL(string: "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1041508813,1340626524&fm=200&gp=0.jpg")
let imageData = try! Data(contentsOf: imageUrl!)
let imageUI = UIImage(data: imageData)

//将图片存入沙盒的函数
private func saveImage(currentImage: UIImage, persent: CGFloat, imageName: String){
    if let imageData = UIImageJPEGRepresentation(currentImage, persent) as NSData? {
        let fullPath = NSHomeDirectory().appending("/Documents/").appending(imageName)
        imageData.write(toFile: fullPath, atomically: true)
        print("fullPath=\(fullPath)")
    }
}
saveImage(currentImage: imageUI!, persent: 2, imageName: "myImage")

//5.从网上查找访问一个JSon接口文件，并采用JSONSerialization和字典对其进行简单解析；
enum MyError:Error {
    case Zero
    case NotURL
}
guard let weatherUrl = URL(string: "http://www.weather.com.cn/data/cityinfo/101010100.html") else{
    throw MyError.NotURL
}
let jsondata = try! Data(contentsOf: weatherUrl)

let json = try! JSONSerialization.jsonObject(with: jsondata, options: .allowFragments)
guard let dic = json as? [String:Any] else{
    throw MyError.NotURL
}
guard let weather = dic["weatherinfo"] as? [String:String] else{
    throw MyError.NotURL
}
let temp1 = weather["temp1"]
let temp2 = weather["temp2"]
