import Foundation
import SwiftUI

struct Course: Identifiable {
    var id: String { code }

    let code: String
    let name: String
    let description: String = "This is a sample description of the study group. This group is really cool and will help you study. We are focused on enhancing the expereince of other students while cultivating a fun environment. "
    let members: Int
    let image: String
    let color: Color
    
    let msgPreview: String = "This is a sample message showing intended functionality."
}

struct Courses {
    var trending: [Course] = [
        Course(code: "CSC 306", name: "Operating Systems", members: 82, image: "gearshape.2", color: .yellow),
        Course(code: "PHY 112", name: "Physics II", members: 82, image: "atom", color: .blue),
        Course(code: "CHE 106", name: "Gen. Chemistry I", members: 182, image: "flask", color: .orange),
        Course(code: "BSC 110", name: "Principles of Biological Science I", members: 88, image: "leaf", color: .green),
        Course(code: "MAT 167", name: "Calculus I", members: 100, image: "function", color: .teal),
        Course(code: "MAT 168", name: "Calculus II", members: 82, image: "sum", color: .indigo)
    ]

    var compSci: [Course] = [
        Course(code: "CSC 101", name: "Intro to Computer Science I", members: 100, image: "desktopcomputer", color: .teal),
        Course(code: "CSC 306", name: "Operating Systems", members: 82, image: "gearshape.2", color: .yellow),
        Course(code: "CSC 413", name: "Algorithms", members: 182, image: "flowchart", color: .purple),
        Course(code: "CSC 411", name: "Intro to DBMS", members: 93, image: "externaldrive.connected.to.line.below", color: .teal),
        Course(code: "CSC 414", name: "Intro to SE", members: 103, image: "hammer", color: .cyan),
        Course(code: "CSC 307", name: "Data Structures", members: 88, image: "square.stack.3d.up", color: .mint)
    ]

    var math: [Course] = [
        Course(code: "MAT 167", name: "Calculus I", members: 100, image: "function", color: .teal),
        Course(code: "MAT 168", name: "Calculus II", members: 82, image: "sum", color: .indigo),
        Course(code: "MAT 326", name: "Intro to Linear Algebra", members: 182, image: "matrix", color: .indigo),
        Course(code: "MAT 320", name: "Prob and Math Stat I", members: 93, image: "chart.bar.xaxis", color: .blue)
    ]

    var english: [Course] = [
        Course(code: "ENG 101", name: "Composition I", members: 100, image: "text.book.closed", color: .orange),
        Course(code: "ENG 102", name: "Composition II", members: 82, image: "text.alignleft", color: .yellow),
        Course(code: "ENG 301", name: "Advanced Grammar", members: 182, image: "textformat.abc", color: .pink),
        Course(code: "ENG 332", name: "Advanced Composition", members: 93, image: "square.and.pencil", color: .red)
    ]

    var science: [Course] = [
        Course(code: "PHY 111", name: "Physics I", members: 100, image: "atom", color: .purple),
        Course(code: "PHY 112", name: "Physics II", members: 82, image: "waveform.path.ecg", color: .blue),
        Course(code: "CHE 106", name: "Gen. Chemistry I", members: 182, image: "flask", color: .orange),
        Course(code: "CHE 107", name: "Gen. Chemistry II", members: 93, image: "testtube.2", color: .yellow),
        Course(code: "CHE 225", name: "Organic Chemistry I", members: 103, image: "hexagon", color: .brown),
        Course(code: "BSC 110", name: "Principles of Biological Science I", members: 88, image: "leaf", color: .green)
    ]
}

/*
 var images: [String: String] = [
     "compSci" : "computermouse",
     "math" : "divide",
     "english" : "book.closed",
     "physics" : "magnifyingglass",
     "chemistry": "flask",
     "biology" : "apple.meditate"
 ]
 */
