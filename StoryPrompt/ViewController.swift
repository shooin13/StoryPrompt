import UIKit

class ViewController: UIViewController {
  
  private let storyPrompt = StoryPromptEntry()
  
  @IBOutlet private weak var nounTextField: UITextField!
  @IBOutlet private weak var adjectiveTextField: UITextField!
  @IBOutlet private weak var verbTextField: UITextField!
  @IBOutlet private weak var numberSlider: UISlider!
  @IBOutlet weak var numberLabel: UILabel!
  
  
  @IBAction func changeNumber(_ sender: UISlider) {
    let number = Int(sender.value)
    numberLabel.text = "Number: \(number)"
    storyPrompt.number = number
  }
  
  @IBAction func changeStoryType(_ sender: UISegmentedControl) {
     if let genre = StoryPrompts.Genre(rawValue: sender.selectedSegmentIndex) {
      storyPrompt.genre = genre
    } else {
      storyPrompt.genre = .scifi
    }
    print(storyPrompt.genre)
  }
  
  @IBAction func generateStoryPrompt(_ sender: Any) {
    updateStoryPrompt()
    print(storyPrompt)
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    numberSlider.value = 7.5
  }
  
  private func updateStoryPrompt() {
    storyPrompt.noun = nounTextField.text ?? ""
    storyPrompt.adjective = adjectiveTextField.text ?? ""
    storyPrompt.verb = verbTextField.text ?? ""
  }
  
}

extension ViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    updateStoryPrompt()
    return true
  }
}
