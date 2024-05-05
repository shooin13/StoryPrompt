import UIKit

final class StoryPromptViewController: UIViewController {
  
  private var storyPrompt = StoryPromptEntry()
  
  @IBOutlet private weak var storyPromptTextView: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    storyPrompt.noun = "toaster"
    storyPrompt.verb = "swims"
    storyPrompt.adjective = "smelly"
    storyPrompt.number = 7
    
    storyPromptTextView.text = storyPrompt.description
  }
  
}
