import SwiftUI

struct GroupAdd: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var courseCode: String = ""
    @State private var courseName: String = ""
    @State private var description: String = ""
   
    @State private var selectedCategory: String = "Computer Science"
    
    // Color picker
    @State private var selectedColor: Color = Color(red: 0.97, green: 0.76, blue: 0.25)
   
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
                        dismiss()
                    } label: {
                        Text("Create Group")
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

#Preview {
    GroupAdd()
}
