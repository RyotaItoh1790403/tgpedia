//
//  ContentView.swift
//  tgpedia
//
//  Created by ryota itoh on 2019/10/02.
//  Copyright © 2019 ryota itoh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showImagePicker: Bool = false
    @State private var image: Image? = nil
    @State private var camera: Bool = false
    @State private var detect: Bool = false
    
    var body: some View {
        
        VStack{
            Image("hedderImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .edgesIgnoringSafeArea(.top)
            
            image?.resizable().scaledToFit()
                
            HStack{
            
                Button("1st label"){
                    print("1st label")
                }.padding()
                    .background(Color.white)
                    .foregroundColor(Color.black)
                    .cornerRadius(10)
                
                Button("2nd label"){
                    print("2nd label")
                }.padding()
                    .background(Color.white)
                    .foregroundColor(Color.black)
                    .cornerRadius(10)
                
                Button("3rd label"){
                    print("3rd label")
                }.padding()
                    .background(Color.white)
                    .foregroundColor(Color.black)
                    .cornerRadius(10)
            }
            
            HStack{
            
                Button("Camera"){
                    self.showImagePicker = true
                    self.camera = true
                    print("Open Camera")
                }.padding()
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                
                Button("Photo Library"){
                    self.showImagePicker = true
                    self.camera = false
                    print("Open Photo Library")
                }.padding()
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                
                Button("Detect"){
                    self.detect = true
                    print("Start Detect")
                }.padding()
                    .background(Color.red)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            }
            

            
        }.sheet(isPresented: self.$showImagePicker){
            PhotoCaptureView(showImagePicker: self.$showImagePicker, image: self.$image, camera: self.$camera, detect: self.$detect)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
