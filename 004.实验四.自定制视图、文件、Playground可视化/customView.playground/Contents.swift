import UIKit
import PlaygroundSupport

class TriangleView:UIView{
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: rect.size.width/2, y: 0))
        path.addLine(to: CGPoint(x: rect.size.width, y: rect.size.height))
        path.addLine(to: CGPoint(x: 0, y: rect.size.height))
        path.close()
        
        UIColor.gray.setFill()
        path.fill()
    }
}

class Controller:UIViewController{
    var label:UILabel!
    var triangle:TriangleView!
    @IBAction func clicked() {
        print("I am clicked!")
        label.text = "I am clicked!";
        UIView.animate(withDuration: 1) {
            self.triangle.center = CGPoint(x: 200, y: 200)
        }
    }
    
    override func loadView() {
        view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
        view.backgroundColor = UIColor.yellow
        
        label = UILabel(frame: CGRect(x: 100, y: 20, width: 200, height: 50))
        label.backgroundColor = UIColor.white
        label.textAlignment = .center
        label.text = "Hello World!";
        view.addSubview(label)
        
        let url = URL(string: "http://47.107.160.68:8080/pictures/mw.jpg")!
        let data = try! Data(contentsOf: url)
        let image = UIImage(data: data)
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 100, width: 400, height: 400))
        imageView.image = image
        view.addSubview(imageView)
        
        let button = UIButton(frame: CGRect(x: 100, y: 600, width: 200, height: 50))
        button.setTitle("Click Me!", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(Controller.clicked), for: UIControlEvents.touchUpInside)
        view.addSubview(button)
        
        triangle = TriangleView(frame: CGRect(x: 100, y: 400, width: 200, height: 200))
        triangle.backgroundColor = UIColor.clear
        view.addSubview(triangle)
        
    }
}

let ct = Controller()
PlaygroundPage.current.liveView = ct
