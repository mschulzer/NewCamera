import SwiftUI

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
  @Binding var isCoordinatorShown: Bool
    @Binding var showSheet: Bool
  @Binding var imageInCoordinator: UIImage?
    
    init(isShown: Binding<Bool>, showSheet: Binding<Bool>, image: Binding<UIImage?>) {
    _isCoordinatorShown = isShown
    _showSheet = showSheet
    _imageInCoordinator = image
  }
    
  func imagePickerController(_ picker: UIImagePickerController,
                didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
     guard let unwrapImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
    imageInCoordinator = unwrapImage
    isCoordinatorShown = false
    showSheet = false
  }
    
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    isCoordinatorShown = false
    showSheet = false
  }
}
