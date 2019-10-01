//
//  PhotoCaptureView.swift
//  tgpedia
//
//  Created by ryota itoh on 2019/10/02.
//  Copyright © 2019 ryota itoh. All rights reserved.
//

import SwiftUI

struct PhotoCaptureView: View {
    
    @Binding var showImagePicker: Bool
    @Binding var image: Image?
    @Binding var camera: Bool
    @Binding var detect: Bool
    
    var body: some View {
        ImagePicker(isShown: $showImagePicker, image: $image, camera: $camera, detect: $detect)
    }
}

struct PhotoCaptureView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCaptureView(showImagePicker: .constant(false), image: .constant(Image("")), camera: .constant(false), detect: .constant(false))
    }
}
