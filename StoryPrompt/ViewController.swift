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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    numberSlider.value = 7.5
    storyPrompt.noun = "toaster"
    storyPrompt.adjective = "smelly"
    storyPrompt.verb = "burps"
    storyPrompt.number = Int(numberSlider.value)
    print(storyPrompt)
    
  }
  
  
}


