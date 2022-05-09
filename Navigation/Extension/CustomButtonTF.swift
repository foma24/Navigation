import Foundation
import UIKit

final class CustomButtonTF: UIButton {
    var buttonTapped: () -> Void
    
    init(buttonTapped: @escaping() -> Void) {
        self.buttonTapped = buttonTapped
        super.init(frame: .zero)
        self.addTarget(self, action: #selector(checkPass), for: .touchUpInside)
        self.toAutoLayout()
        self.backgroundColor = .orange
        self.setTitle("Check Password", for: .normal)
        self.setTitleColor(.white, for: .normal)
    }
    
    @objc private func checkPass() {
        self.buttonTapped()
        if Word.shared.getPassword != "" {
            Word.shared.checkWord()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
