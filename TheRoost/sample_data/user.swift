import Foundation
import SwiftUI

struct sampleUser {
    var userName: String =  "John Doe"
    var pass: String = "12345"
    
    var courses: [Course] = [
        Course(code: "CSC 411", name: "Intro to DBMS", members: 93, image: "externaldrive.connected.to.line.below", color: .teal),
        Course(code: "CSC 414", name: "Intro to SE", members: 103, image: "hammer", color: .cyan),
        Course(code: "CSC 307", name: "Data Structures", members: 88, image: "square.stack.3d.up", color: .mint),
        Course(code: "MAT 326", name: "Intro to Linear Algebra", members: 182, image: "matrix", color: .indigo),
        Course(code: "MAT 320", name: "Prob and Math Stat I", members: 93, image: "chart.bar.xaxis", color: .blue)
    ]
}

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
