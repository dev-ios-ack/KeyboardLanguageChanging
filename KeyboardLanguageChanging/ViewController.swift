import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    var lang = "en-US"
    
    @IBAction func selectLanguage(_ sender: UISegmentedControl) {
        // BEGIN: Changing Keyboard language en-US to vi-VN is working if this comment this block out.
//        lang = "ja-JP"
//        self.textField.resignFirstResponder()
//        self.textField.becomeFirstResponder()
        // END:   Changing Keyboard language en-US to vi-VN is working if this comment this block out.

        switch sender.selectedSegmentIndex {
        case 0: // English
            lang = "en-US"
        case 1: // Vietnamese
            lang = "vi-VN"
        case 2: // Japanese
            lang = "ja-JP"
        default:
            break
        }
        
        // ReDisplay Keyboard
        self.textField.resignFirstResponder()
        self.textField.becomeFirstResponder()

    }
    
    override var textInputMode: UITextInputMode?{
        var tim = super.textInputMode
        
        for mode in UITextInputMode.activeInputModes {
            if mode.primaryLanguage!.localizedStandardContains(lang) {
                tim = mode
            }
            print("Available Keyboard: ", mode.primaryLanguage ?? "nil")
        }
        
        print("Selected language: ", tim?.primaryLanguage ?? "unknown")
        
        return tim
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }


}

