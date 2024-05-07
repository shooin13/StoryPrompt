import UIKit

final class StoryPromptViewController: UIViewController {
  
  weak var storyPrompt: StoryPromptEntry?
  var isNewStoryPrompt = false
  
  @IBOutlet private weak var storyPromptTextView: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    storyPromptTextView.text = storyPrompt?.description
    
    if isNewStoryPrompt {
      let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveStoryPrompt))
      let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelStoryPrompt))
      
      navigationItem.rightBarButtonItem = saveButton
      navigationItem.leftBarButtonItem = cancelButton
    }
  }
  
  @objc private func cancelStoryPrompt() {
    performSegue(withIdentifier: "CancelStoryPrompt", sender: nil)
  }
  
  @objc private func saveStoryPrompt() {
    performSegue(withIdentifier: "SaveStoryPrompt", sender: nil)
  }
}
