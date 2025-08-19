import SwiftUI

struct ContentView: View {
    // MARK: - State Variables
    @State private var firstName: String = "Michael"
    @State private var lastName: String = "Dacanay"
    @State private var selectedYear: String = "Fourth"
    @State private var petsCount: Int = 1
    @State private var wantsMorePets: Bool = false
    @State private var showingIntroduction: Bool = false
    
    let years = ["First", "Second", "Third", "Fourth"]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // MARK: - Banner Image
                    Image("banner")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 120)
                        .clipped()
                        .cornerRadius(8)
                        .padding(.horizontal)
                    
                    VStack(spacing: 16) {
                        // MARK: - First Name Field
                        HStack {
                            Text("First")
                                .foregroundColor(.secondary)
                            Spacer()
                            TextField("First Name", text: $firstName)
                                .multilineTextAlignment(.trailing)
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        
                        // MARK: - Last Name Field
                        HStack {
                            Text("Last")
                                .foregroundColor(.secondary)
                            Spacer()
                            TextField("Last Name", text: $lastName)
                                .multilineTextAlignment(.trailing)
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        
                        // MARK: - School Field
                        HStack {
                            Text("School")
                                .foregroundColor(.secondary)
                            Spacer()
                            Text("University of Wisconsin-Madison")
                                .foregroundColor(.secondary)
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        
                        // MARK: - Year Selection
                        VStack(alignment: .leading, spacing: 12) {
                            HStack(spacing: 8) {
                                ForEach(years, id: \.self) { year in
                                    Button(action: {
                                        selectedYear = year
                                    }) {
                                        Text(year)
                                            .font(.system(size: 14, weight: .medium))
                                            .foregroundColor(selectedYear == year ? .white : .secondary)
                                            .padding(.horizontal, 16)
                                            .padding(.vertical, 8)
                                            .background(selectedYear == year ? Color.blue : Color(.systemGray5))
                                            .cornerRadius(8)
                                    }
                                }
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: .black.opacity(0.05), radius: 1, x: 0, y: 1)
                        
                        // MARK: - Pets Counter
                        VStack {
                            HStack {
                                Text("Pets")
                                    .foregroundColor(.primary)
                                Spacer()
                                HStack(spacing: 16) {
                                    Button(action: {
                                        if petsCount > 0 {
                                            petsCount -= 1
                                        }
                                    }) {
                                        Image(systemName: "minus")
                                            .font(.system(size: 16, weight: .medium))
                                            .foregroundColor(.secondary)
                                            .frame(width: 32, height: 32)
                                            .background(Color(.systemGray5))
                                            .clipShape(Circle())
                                    }
                                    
                                    Text("\(petsCount)")
                                        .font(.system(size: 18, weight: .medium))
                                        .frame(width: 32)
                                    
                                    Button(action: {
                                        petsCount += 1
                                    }) {
                                        Image(systemName: "plus")
                                            .font(.system(size: 16, weight: .medium))
                                            .foregroundColor(.secondary)
                                            .frame(width: 32, height: 32)
                                            .background(Color(.systemGray5))
                                            .clipShape(Circle())
                                    }
                                }
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: .black.opacity(0.05), radius: 1, x: 0, y: 1)
                        
                        // MARK: - More Pets Toggle
                        HStack {
                            Text("More pets?")
                                .foregroundColor(.secondary)
                            Spacer()
                            Toggle("", isOn: $wantsMorePets)
                                .labelsHidden()
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        
                        // MARK: - Introduce Self Button
                        Button(action: {
                            showingIntroduction = true
                        }) {
                            Text("Introduce self")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(8)
                        }
                        .padding(.top, 20)
                    }
                    .padding(.horizontal)
                }
            }
            .background(Color(.systemGray6))
            .navigationBarHidden(true)
        }
        .alert("My Introduction", isPresented: $showingIntroduction) {
            Button("Nice to meet you!") { }
        } message: {
            Text("My name is \(firstName) \(lastName) and I attend University of Wisconsin-Madison. I am currently in my \(selectedYear) year and I own \(petsCount) cats. It is \(wantsMorePets ? "true" : "false") that I want more pets.")
        }
    }
}

#Preview {
    ContentView()
}

