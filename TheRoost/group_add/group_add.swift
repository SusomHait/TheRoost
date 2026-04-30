import SwiftUI

struct GroupAdd: View {
   
    @State private var courseCode: String = ""
    @State private var courseName: String = ""
    @State private var instructor: String = ""
    @State private var time: String = ""
    @State private var place: String = ""
   
    // Vibe checkboxes
    @State private var seriousStudy: Bool = false
    @State private var completeHW: Bool = false
    @State private var justChilling: Bool = false
   
    // Color picker
    @State private var selectedColor: Color = .green
   
    var body: some View {
        ZStack {
            Color(red: 0.97, green: 0.76, blue: 0.25) // golden yellow background to match usm colors
                .ignoresSafeArea()
           
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                   
                    // Title
                    Text("ADD YOUR STUDY GROUP")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 20)
                   
                    Divider()
                        .background(.black)
                   
                    // Course Code
                    FormField(label: "Course\nCode", text: $courseCode)
                   
                    Divider().background(.black.opacity(0.3))
                   
                    // Course Name
                    FormField(label: "Course\nName", text: $courseName)
                   
                    Divider().background(.black.opacity(0.3))
                   
                    // Instructor
                    FormField(label: "Instructor", text: $instructor)
                   
                    Divider().background(.black.opacity(0.3))
                   
                    // Vibe for Group
                    HStack(alignment: .top, spacing: 16) {
                        VStack(alignment: .leading) {
                            Text("Vibe for\nGroup")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.black)
                            Text("(Can Choose Multiple)")
                                .font(.caption2)
                                .foregroundStyle(.black.opacity(0.6))
                        }
                        .frame(width: 100, alignment: .leading)
                      
                        VStack(alignment: .leading, spacing: 8) {
                            CheckboxRow(label: "Serious Study", isChecked: $seriousStudy)
                            CheckboxRow(label: "Complete HW\ntogether", isChecked: $completeHW)
                            CheckboxRow(label: "Just Chilling", isChecked: $justChilling)
                        }
                    }
                    .padding(.vertical, 4)
                   
                    Divider().background(.black.opacity(0.3))
                   
                    // Time
                    FormField(label: "Time", text: $time)
                   
                    Divider().background(.black.opacity(0.3))
                   
                    // Place
                    FormField(label: "Place", text: $place)
                   
                    Divider().background(.black.opacity(0.3))
                   
                    // Color Preview
                    HStack(spacing: 16) {
                        Text("Color\nPreview:")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                            .frame(width: 100, alignment: .leading)
                      
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(selectedColor)
                            .frame(width: 100, height: 40)
                      
                        ColorPicker("", selection: $selectedColor)
                            .labelsHidden()
                            .scaleEffect(1.3)
                    }
                    .padding(.vertical, 4)
                   
                    Divider().background(.black.opacity(0.3))
                   
                    // Add Group Button
                    Button {
                        // action here later
                    } label: {
                        Text("Add Group")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background {
                                RoundedRectangle(cornerRadius: 30)
                                    .foregroundStyle(.black)
                            }
                    }
                    .padding(.vertical, 10)
                  
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
            }
        }
    }
}

// Reusable Form Field
struct FormField: View {
    let label: String
    @Binding var text: String
   
    var body: some View {
        HStack(spacing: 16) {
            Text(label)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.black)
                .frame(width: 100, alignment: .leading)
           
            TextField("", text: $text)
                .padding(8)
                .background {
                    RoundedRectangle(cornerRadius: 6)
                        .foregroundStyle(.white.opacity(0.85))
                }
        }
    }
}

// Checkbox Row
struct CheckboxRow: View {
    let label: String
    @Binding var isChecked: Bool
   
    var body: some View {
        Button {
            isChecked.toggle()
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
                    .foregroundStyle(.black)
                    .multilineTextAlignment(.leading)
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    GroupAdd()
}
