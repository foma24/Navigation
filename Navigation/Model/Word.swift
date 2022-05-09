import Foundation

class Word {
    static let shared = Word()
    let password: String = "Password"
    var getPassword: String = ""
    
    //init() {}
    
    func checkWord() {
        let notify = NotificationCenter.default
        if getPassword == password {
            notify.post(name: Notification.Name("Correct"), object: nil)
        } else {
            notify.post(name: Notification.Name("Wrong"), object: nil)
        }
    }
}
