import SwiftUI

struct GroupAdd: View {
    @Environment(\.dismiss) private var dismiss
    
    @Binding var courses: Courses
    
    @State private var courseCode: String = ""
    @State private var courseName: String = ""
    @State private var description: String = ""
   
    @State private var selectedCategory: String = "Computer Science"
    
    // Color picker
    @State private var selectedColor: Color = Color(red: 0.97, green: 0.76, blue: 0.25)
    
    @State private var showAlert = false
    @State private var alertMsg = ""
   
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    var body: some View {
        VStack {
            
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                   
                    // Title
                    HStack {
                        Image(systemName: "folder.badge.plus")
                        Text("Create a Group")
                            .bold()
                    }
                    .foregroundStyle(.headerTxt)
                    .padding(.top, 30)
                    .font(.largeTitle)
                    
                   
                    Divider().background(.panel.opacity(0.3))
                   
                    // Course Code
                    FormField(label: "Course Code:", preview: "Enter code", text: $courseCode)
                   
                    Divider().background(.panel.opacity(0.3))
                   
                    // Course Name
                    FormField(label: "Course Name:", preview: "Enter name", text: $courseName)
                   
                    Divider().background(.panel.opacity(0.3))
                   
                    // Description
                    HStack(spacing: 10) {
                        Text("Description")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 150, alignment: .leading)
                        
                        ZStack(alignment: .topLeading) {
                            if description.isEmpty {
                                Text("Enter description")
                                    .foregroundColor(.gray.opacity(0.5))
                                    .padding(.top, 12)
                                    .padding(.leading, 12)
                            }

                            TextEditor(text: $description)
                                .scrollContentBackground(.hidden)
                                .padding(8)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(.systemGray6))
                        )
                        .frame(height: 100)
                    }
                    .foregroundStyle(.normalTxt)

                    
                    Divider().background(.panel.opacity(0.3))
                    
                    // Group Category
                    HStack(alignment: .top, spacing: 16) {
                        VStack(alignment: .leading) {
                            Text("Category")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.normalTxt)
                        }
                        .frame(width: 100, alignment: .leading)
                        
                        Spacer()
                      
                        VStack(alignment: .leading, spacing: 8) {
                            CheckboxRow(
                                label: "Computer Science",
                                isChecked: (selectedCategory == "Computer Science")
                            ) {
                                selectedCategory = "Computer Science"
                            }

                            CheckboxRow(
                                label: "Math",
                                isChecked: selectedCategory == "Math"
                            ) {
                                selectedCategory = "Math"
                            }

                            CheckboxRow(
                                label: "English",
                                isChecked: selectedCategory == "English"
                            ) {
                                selectedCategory = "English"
                            }

                            CheckboxRow(
                                label: "Science",
                                isChecked: selectedCategory == "Science"
                            ) {
                                selectedCategory = "Science"
                            }
                            
                        }
                    }
                    .padding(.vertical, 4)
                   
                    Divider().background(.panel.opacity(0.3))
                   
                    // Color Preview
                    HStack(spacing: 16) {
                        Text("Color Preview:")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.normalTxt)
                            .frame(width: 100, alignment: .leading)
                      
                        Spacer()
                        
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(selectedColor)
                            .frame(width: 100, height: 40)
                      
                        ColorPicker("", selection: $selectedColor)
                            .labelsHidden()
                            .scaleEffect(1.3)
                    }
                    .padding(.vertical, 4)
                   
                    Divider().background(.panel.opacity(0.3))
                   
                    // Add Group Button
                    Button {
                        if courseCode.trimmingCharacters(in: .whitespaces).isEmpty ||
                           courseName.trimmingCharacters(in: .whitespaces).isEmpty ||
                           description.trimmingCharacters(in: .whitespaces).isEmpty {
                            
                            alertMsg = "Please fill out all fields."
                            showAlert = true
                            return
                        }
                        
                        let newGroup = Course(
                            code: courseCode,
                            name: courseName,
                            members: 1,
                            image: "folder.badge.plus",
                            color: selectedColor
                        )
                        
                        switch selectedCategory {
                            case "Computer Science":
                                courses.compSci.append(newGroup)
                            case "Math":
                                courses.math.append(newGroup)
                            case "English":
                                courses.english.append(newGroup)
                            case "Science":
                                courses.science.append(newGroup)
                            default:
                                break
                        }
                        
                        dismiss()
                    } label: {
                        Text(isLoggedIn ? "Create Group" : "Log In to Create a Group")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundStyle(.contrast)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background {
                                RoundedRectangle(cornerRadius: 30)
                                    .foregroundStyle(.headerTxt)
                            }
                    }
                    .disabled(!isLoggedIn)
                    .opacity(isLoggedIn ? 1 : 0.5)
                    .padding(.vertical, 10)
                  
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
            }
        }
        .background(.panel)
    }
}

// Reusable Form Field
struct FormField: View {
    let label: String
    let preview: String
    @Binding var text: String
   
    var body: some View {
        HStack(spacing: 10) {
            Text(label)
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 150, alignment: .leading)
            
            TextField(preview, text: $text)
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.systemGray6))
                )
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundStyle(.normalTxt)
    }
}

// Checkbox Row
struct CheckboxRow: View {
    let label: String
    let isChecked: Bool
    let action: () -> Void
   
    var body: some View {
        Button {
            action()
        } label: {
            HStack(alignment: .top, spacing: 8) {
                RoundedRectangle(cornerRadius: 4)
                    .stroke(.black, lineWidth: 1.5)
                    .background {
                        RoundedRectangle(cornerRadius: 4)
                            .foregroundStyle(isChecked ? .black : .white.opacity(0.85))
                    }
                    .frame(width: 18, height: 18)
                    .overlay {
                        if isChecked {
                            Image(systemName: "checkmark")
                                .font(.caption.bold())
                                .foregroundStyle(.white)
                        }
                    }
              
                Text(label)
                    .font(.subheadline)
                    .foregroundStyle(.normalTxt)
                    .multilineTextAlignment(.leading)
            }
        }
        .buttonStyle(.plain)
    }
}
