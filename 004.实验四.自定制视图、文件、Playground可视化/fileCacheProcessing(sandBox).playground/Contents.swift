
import UIKit;

//(1)文件缓存处理
//a)判断沙盒的Document目录下是否存在某文件夹，如果没有则新建一个该文件夹；
//b)判断是否该文件夹下存在一个图片文件，如果存在该文件，读取该文件到一个图片对象中并进行显示，如果不存在则从网上下载一张图片并保存到该图片文件中

//获得沙盒的根路径
let root = NSHomeDirectory()
//获得Documents路径
let documentPath = root + "/Documents";
//创建等待判断的文件夹名 myDir以及图片文件名
let dirName = "myDir";
let imgName = "myImg.jpg";
//获取文件夹路径
let dirPath = documentPath + "/" + dirName;
//获取图片路径
let imgPath = dirPath + "/" + imgName;
//初始化文件管理器
let fileManager = FileManager.default
//判断文件夹是否存在
let dirExist = fileManager.fileExists(atPath: dirPath)
if (dirExist) {
    //文件夹存在则判断该文件夹下是否存在图片
    let imgExist = fileManager.fileExists(atPath: imgPath)
    if (imgExist) {
        print("图片路径为：" + imgPath)
        UIImage(contentsOfFile: imgPath)
    }else{
        print("图片不存在！")
        //图片不存在，则从网上下载一张并保存在其中
        let imageUrl = URL(string: "http://47.107.160.68:8080/pictures/mw.jpg")!
        let imageData = try? Data(contentsOf: imageUrl)
        let url = URL(fileURLWithPath:imgPath)
        try? imageData?.write(to: url)
        let image = UIImage(data: imageData!)
    }
}else{
    //文件夹不存在则创建 myDir文件夹
    try fileManager.createDirectory(atPath: dirPath, withIntermediateDirectories: true, attributes: nil)
}
