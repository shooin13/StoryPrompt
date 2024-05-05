import UIKit
import PhotosUI

final class AddStoryPromptViewController: UIViewController {
  
  private let storyPrompt = StoryPromptEntry()
  
  @IBOutlet private weak var nounTextField: UITextField!
  @IBOutlet private weak var adjectiveTextField: UITextField!
  @IBOutlet private weak var verbTextField: UITextField!
  @IBOutlet private weak var numberSlider: UISlider!
  @IBOutlet private weak var numberLabel: UILabel!
  @IBOutlet private weak var storyPromptImageView: UIImageView!
  
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
    if storyPrompt.isValid() {
      print(storyPrompt)
    } else {
      let alert = UIAlertController(title: "Innvalid story prompt",
                                    message: "Please fill out all the fields",
                                    preferredStyle: .alert)
      let action = UIAlertAction(title: "OK", style: .default) { _ in
        alert.dismiss(animated: true)
      }
      alert.addAction(action)
      present(alert, animated: true)
    }
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    numberSlider.value = 7.5
    storyPromptImageView.isUserInteractionEnabled = true
    let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeImage))
    storyPromptImageView.addGestureRecognizer(gestureRecognizer)
  }
  
  private func updateStoryPrompt() {
    storyPrompt.noun = nounTextField.text ?? ""
    storyPrompt.adjective = adjectiveTextField.text ?? ""
    storyPrompt.verb = verbTextField.text ?? ""
  }
  
  @objc private func changeImage() {
    var configuration = PHPickerConfiguration()
    configuration.filter = .images
    configuration.selectionLimit = 1
    let controller = PHPickerViewController(configuration: configuration)
    controller.delegate = self
    present(controller, animated: true)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "StoryPrompt" {
      guard let storyPromptViewController = segue.destination as? StoryPromptViewController else { return }
      storyPromptViewController.storyPrompt = storyPrompt
    }
  }
  
}

extension AddStoryPromptViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    updateStoryPrompt()
    return true
  }
}


extension AddStoryPromptViewController: PHPickerViewControllerDelegate {
  func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
    dismiss(animated: true)
    if !results.isEmpty {
      guard let result = results.first else { return }
      let itemProvider = result.itemProvider
      if itemProvider.canLoadObject(ofClass: UIImage.self) {
        itemProvider.loadObject(ofClass: UIImage.self) { [ weak self ] image, error in
          guard let image = image as? UIImage else { return }
          DispatchQueue.main.async {
            self?.storyPromptImageView.image = image
          }
        }
      }
    }
  }
  
  
}
