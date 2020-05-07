//
//  ContentView.swift
//  NewCamera
//
//  Created by Morten Schultz on 06/05/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var showCamera: Bool = false
    @State var showSheet: Bool = false
    @State var image: UIImage?
    
    
    var body: some View {
        NavigationView {
            VStack {
                Image(uiImage: image ?? UIImage(named: "placeholder")!)
                    .resizable()
                    .frame(width: 160, height: 180)
                
                Spacer()
                    .frame(height: 60)
                
                Button(action: {
                    self.showSheet.toggle()
                }) {
                    HStack {
                        Image(systemName: "camera")
                        Text("Take photo")
                    }
                    .frame(width: 200, height: 40)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(40)
                }
            }
        }.sheet(isPresented: $showSheet) {
            CameraView(isShown: self.$showCamera, showSheet: self.$showSheet, image: self.$image)
        }
    }
}

struct CameraView {
  /// MARK: - Properties
  @Binding var isShown: Bool
    @Binding var showSheet: Bool
  @Binding var image: UIImage?
  
  func makeCoordinator() -> Coordinator {
    return Coordinator(isShown: $isShown, showSheet: $showSheet, image: $image)
  }
}

extension CameraView: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<CameraView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        
        // GALLERY BY DEFAULT
        //picker.sourceType = .camera
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<CameraView>) {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
