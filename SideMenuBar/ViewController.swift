import UIKit

class ViewController: UIViewController {

    //MARK: variables
    
    var sideBarView: UIView!
    var tableView:UITableView!
    var isEnableSideBarView:Bool = false
    var imgArray: [String] = ["dashboard", "revanue", "notification", "like", "wallet"]
    var imgeNameLbl = ["Dashboard", "Revanue", "Notification", "Like", "Wallet"]
    var imgView: UIImageView!
    var lbl: UILabel!
    
    var swipToRight = UISwipeGestureRecognizer()
    var swipeToLeft = UISwipeGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let menuBtn = UIBarButtonItem(title: "Menu", style: .done, target: self, action: #selector(menuBtnClick))
        self.navigationItem.leftBarButtonItem = menuBtn
        
        sideBarView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: self.view.bounds.height))
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: self.view.bounds.height))
        
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        self.view.addSubview(sideBarView)
        self.sideBarView.addSubview(tableView)
        
        swipToRight = UISwipeGestureRecognizer(target: self, action: #selector(swipedToRight))
        swipToRight.direction = .right
        self.view.addGestureRecognizer(swipToRight)
        
        swipeToLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipedToLeft))
        swipeToLeft.direction = .left
//        self.view.addGestureRecognizer(swipeToLeft)
        
    }

    
    @objc func swipedToLeft() {
        print("swipedToLeft")
        self.view.addGestureRecognizer(swipToRight)
        self.view.removeGestureRecognizer(swipeToLeft)
        UIView.animate(withDuration: 0.5) {
            self.sideBarView.frame = CGRect(x: 0, y: 50, width: 0, height: self.view.bounds.height)
            self.tableView.frame = CGRect(x: 0, y: 50, width: 150, height: self.view.bounds.height)
            
            // Decrease the width of sideBarView
            self.sideBarView.frame.size.width /= 3.0
            self.tableView.frame.size.width /= 3.5
        }
        isEnableSideBarView = false
    }


    
    @objc func swipedToRight() {
        
        print("swipedToRight")
        
        self.view.addGestureRecognizer(swipeToLeft)
        self.view.removeGestureRecognizer(swipToRight)
        UIView.animate(withDuration: 0.5) {
            self.sideBarView.frame = CGRect(x: 0, y: 50, width: self.view.bounds.width/1.3, height: self.view.bounds.height)
            self.tableView.frame = CGRect(x: 0, y: 50, width: self.view.bounds.width/1.3, height: self.view.bounds.height)
            
            
        }
        isEnableSideBarView = true
    }
    
    
    
    
    
    @objc func menuBtnClick() {
        print("btn click")
        
        if isEnableSideBarView {
            
            self.view.addGestureRecognizer(swipToRight)
            self.view.removeGestureRecognizer(swipeToLeft)
            UIView.animate(withDuration: 0.5) {
                self.sideBarView.frame = CGRect(x: 0, y: 50, width: 50, height: self.view.bounds.height)
                self.tableView.frame = CGRect(x: 0, y: 50, width: 50, height: self.view.bounds.height)
            }
            isEnableSideBarView = false

            
        } else {
            
            self.view.addGestureRecognizer(swipeToLeft)
            self.view.removeGestureRecognizer(swipToRight)

            UIView.animate(withDuration: 0.5) {
                self.sideBarView.frame = CGRect(x: 0, y: 50, width: self.view.bounds.width/1.5, height: self.view.bounds.height)
                self.tableView.frame = CGRect(x: 0, y: 50, width: self.view.bounds.width/1.5, height: self.view.bounds.height)
            }
            isEnableSideBarView = true

        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        imgView = UIImageView(frame: CGRect(x: 8, y: 8, width: cell.bounds.height-16, height: cell.bounds.height-16))
        imgView.contentMode = .scaleToFill
        
        if let image = UIImage(named: self.imgArray[indexPath.row]) {
            imgView.image = image
        } else {
            // Handle the case where the image is not found
            imgView.image = nil
        }
        
        cell.addSubview(imgView)
        
        lbl = UILabel(frame: CGRect(x: imgView.frame.maxX + 16, y: 8, width: cell.bounds.width - (imgView.frame.maxX + 24), height: cell.bounds.height-16))
        lbl.text = "\(imgeNameLbl[indexPath.row])"
        
        cell.addSubview(lbl)
        
        return cell
    }
}
