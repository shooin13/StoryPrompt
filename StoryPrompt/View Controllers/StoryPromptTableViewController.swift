import UIKit

final class StoryPromptTableViewController: UITableViewController  {
  private var storyPrompts = [StoryPromptEntry]()
  
  @IBAction private func saveStoryPrompt(unwindSegue: UIStoryboardSegue) {
    guard let storyPromptViewController = unwindSegue.source as? StoryPromptViewController,
            let storyPrompt = storyPromptViewController.storyPrompt else { return }
    storyPrompts.append(storyPrompt)
    tableView.reloadData()
  }
  
  @IBAction func saveStoryPrompt(_ sender: Any) {
    performSegue(withIdentifier: "SaveStoryPrompt", sender: nil)
  }
  
  @IBAction private func cancelStoryPrompt(unwindSegue: UIStoryboardSegue) {
    dismiss(animated: true, completion: nil)
  }
  
  @IBAction private func cancelStoryPrompt(_ sender: Any) {
    performSegue(withIdentifier: "CancelStoryPrompt", sender: nil)
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
  
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    storyPrompts.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "StoryPromptCell", for: indexPath)
    cell.textLabel?.text = "Prompt \(indexPath.row + 1)"
    cell.imageView?.image = storyPrompts[indexPath.row].image
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let storyPrompt = storyPrompts[indexPath.row]
    performSegue(withIdentifier: "ShowStoryPrompt", sender: storyPrompt)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "ShowStoryPrompt" {
      guard let storyPromptViewController = segue.destination as? StoryPromptViewController,
            let storyPrompt = sender as? StoryPromptEntry else { return }
      storyPromptViewController.storyPrompt = storyPrompt
    }
  }
}
