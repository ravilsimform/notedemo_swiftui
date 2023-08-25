//
//  TextDetailView.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 24/08/23.
//

import SwiftUI

struct TextDetailView: View {
     var noteData: NoteModel? = nil
    @StateObject var detailViewModel: DetailViewModel = DetailViewModel()
    
    var body: some View {
        NavigationView {
            ZStack (alignment: .bottom){
                ScrollView {
                    textView
                }
                bottomView
            }
            .toolbar {
                ToolbarItem (placement:.navigationBarLeading){
                    Button {
                        
                    } label: {
                        Image(systemName: "arrowshape.backward")
                            .resizable()
                            .frame(width:15,height:15)
                    }
                }
                ToolbarItemGroup (placement: .automatic){
                        Button {
                            
                        } label: {
                            Image(systemName: "pin")
                                .resizable()
                                .frame(width:15,height:20)
                        }
                        Button {
                            
                        } label: {
                            Image(systemName: "bell")
                                .resizable()
                                .frame(width:15,height:17)
                        }
                        Button {
                            
                        } label: {
                            Image(systemName: "archivebox")
                                .resizable()
                                .frame(width:15,height:17)
                        }
                }
                
            }
            .navigationBarBackButtonHidden(true)
            
        }
    }
    
    var textView : some View {
        VStack {
            if #available(iOS 16.0, *) {
                TextField("Title", text: $detailViewModel.titleTextField,axis:.vertical).font(.title)
                    .lineLimit(5)
                    .textInputAutocapitalization(.sentences)
                    .autocorrectionDisabled(false)
            } else {
                // Fallback on earlier versions
            }
            
            if #available(iOS 16.0, *) {
                TextField("Note", text: $detailViewModel.descriptionTextField,axis:.vertical).font(.body).lineLimit(1000000)
                    .textInputAutocapitalization(.sentences)
                    .autocorrectionDisabled(false)
            } else {
                // Fallback on earlier versions
            }
        }.padding(.all,10)
            .onAppear {
                $detailViewModel.titleTextField.wrappedValue = noteData?.noteTitle ?? ""
                $detailViewModel.descriptionTextField.wrappedValue = noteData?.noteDesc ?? ""
            }
    }
    
    
    var bottomView: some View {
        ZStack (alignment:.bottom) {
            RoundedRectangle(cornerRadius: 0)
                .fill(.white)
                .overlay(
                    HStack (spacing:10){
                        Button {
                            
                        } label: {
                            Image(systemName: "plus.app")
                                .resizable()
                                .frame(width:20,height:20,alignment: .center)
                        }
                        Button {
                            
                        } label: {
                            Image(systemName: "paintpalette")
                                .resizable()
                                .frame(width:20,height:20,alignment: .center)
                        }
                        Spacer()
                        Text("Edited Apr 17").font(.system(size: 10))
                        Spacer()
                        Button {
                            
                        } label: {
                            Image(systemName: "slider.vertical.3")
                                .resizable()
                                .frame(width:20,height:20,alignment: .center)
                        }

                    }.padding(.all,10)
                )
        }.frame(width:UIScreen.main.bounds.width,height:50)
            
    }
}

//struct TextDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        TextDetailView()
//    }
//}
