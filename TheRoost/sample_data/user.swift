import Foundation

struct MessagePreview: Hashable {
    var id: String { name }
    
    let name: String
    let preview: String
}

struct UserChats {
    var overview: [MessagePreview] = [
        MessagePreview(name: "CSC 307", preview: "Hey guys! Lets meet up on Sunday to work on the homework together."),
        MessagePreview(name: "CSC 411", preview: "Is anyone looking for a project group? I'm looking for two more people."),
        MessagePreview(name: "CSC 412", preview: "We should set up an end of the semester party!")
    ]
}
