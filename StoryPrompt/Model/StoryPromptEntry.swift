import Foundation
import UIKit

class StoryPromptEntry {
  var number = 0
  var verb = ""
  var adjective = ""
  var noun = ""
  var image = UIImage(named: "redCat")
  var genre = StoryPrompts.Genre.scifi
  var text = ""

  init() {
    text = StoryPrompts.promptFor(genre: genre)
  }

  func isValid() -> Bool {
    return !(verb.isEmpty && adjective.isEmpty && noun.isEmpty)
  }
}

extension StoryPromptEntry: CustomStringConvertible {
  var description: String {
    return text.replacingOccurrences(of: "<noun>", with: noun)
               .replacingOccurrences(of: "<verb>", with: verb)
               .replacingOccurrences(of: "<number>", with: String(number))
               .replacingOccurrences(of: "<adjective>", with: adjective)
  }
}

