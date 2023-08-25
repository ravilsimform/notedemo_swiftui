//
//  NoteListItem.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 22/08/23.
//

import SwiftUI

struct NoteListItem: View {
     
    var noteItem: NoteModel? = nil
    
    var body: some View {
        NavigationLink(destination: TextDetailView(noteData:noteItem!)) {
            ZStack (alignment:.topLeading) {
                RoundedRectangle(cornerRadius:20).fill(Color.white)
                    VStack(alignment: .leading) {
                        Text(noteItem?.noteTitle ?? "data").font(.system(size: 14)).fontWeight(.medium).foregroundColor(.black).multilineTextAlignment(.leading)
                            .padding([.top],1.0)
                            .padding([.bottom],0.2)
                        Text(noteItem?.noteDesc ?? "data").font(.system(size: 12)).foregroundColor(.gray).multilineTextAlignment(.leading)
                            .padding([.top],1.0)
                            .padding([.bottom],0.2)
                    }.padding(.all,4.0)
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .gray.opacity(1), radius: 1,x: 0.5,y: 0.5)
            .overlay( /// apply a rounded border
                RoundedRectangle(cornerRadius: 10)
                    .stroke(AppThemeColor.themeColor, lineWidth: 1)
            )
            .padding(.all,5.0)
        }
    }
}

struct NoteListItem_Previews: PreviewProvider {
    static var previews: some View {
        NoteListItem()
    }
}
