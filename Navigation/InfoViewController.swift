import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Background
        view.backgroundColor = .gray
        
        //MARK: Alert button
        let alertButton = UIButton(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
        alertButton.backgroundColor = .red
        alertButton.setTitle("Alert", for: .normal)
        alertButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(alertButton)
    }
    
    //MARK: - Alert button tapped
    @objc func buttonAction(sender: UIButton!) {
        let infoAC = UIAlertController(title: "Alert", message: "Tap for message in console", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Alert", style: .default) { _ in
            print("Alert message")
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        infoAC.addAction(alertAction)
        infoAC.addAction(cancel)
        self.present(infoAC, animated: true, completion: nil)
    }
}
