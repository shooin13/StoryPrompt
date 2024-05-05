import UIKit

final class StoryPromptViewController: UIViewController {
  
  var storyPrompt: StoryPromptEntry?
  
  @IBOutlet private weak var storyPromptTextView: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    storyPromptTextView.text = storyPrompt?.description
  }
  
  override func viewWillAppear(_ animated: Bool) {
    navigationController?.setNavigationBarHidden(true, animated: animated)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    navigationController?.setNavigationBarHidden(false, animated: animated)
  }
  
}
