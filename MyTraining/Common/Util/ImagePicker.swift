//
//  ImagePicker.swift
//  MyTraining
//
//  Created by Manoel Leal on 23/09/22.
//

import SwiftUI
import PhotosUI

@MainActor
class ImagePicker: ObservableObject {
    
    @Published var image: Image?
    @Published var imageData: Data?
    @Published var imageSelection: PhotosPickerItem? {
        didSet {
            if let imageSelection {
                Task {
                    try await loadTransferable(from: imageSelection)
                }
            }
        }
    }
    
    func loadTransferable(from imageSelection: PhotosPickerItem?) async throws {
        do {
            if let data = try await imageSelection?.loadTransferable(type: Data.self){
                
                self.imageData = data
                
                if let uiImage = UIImage(data: data){
                    self.image = Image(uiImage: uiImage)
                }
            }
        } catch {
            print(error.localizedDescription)
            image = nil
        }
    }
}
