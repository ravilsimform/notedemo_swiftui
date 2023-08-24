//
//  NoteListView.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 22/08/23.
//

import SwiftUI
import Combine
struct NoteListView: View {
    
    var title: String? = ""
    let columns = [
        GridItem(.adaptive(minimum: 200),alignment: .top),
        GridItem(.adaptive(minimum: 200),alignment: .top)
    ]
    
   @StateObject var homeViewModel: HomeViewModel = HomeViewModel()
    
    init(title:String? = nil){
        self.title = title
    
    }
    
    var body: some View {
        VStack(alignment: .leading) {
        /*    if(homeViewModel.showProgress) {
                ProgressView()
            } else if (!(homeViewModel.notes?.isEmpty ?? false)){*/
                Section(
                    header: Text(title ?? "12/12/1234").foregroundColor(Color.gray).font(.caption).fontWeight(.none).frame(alignment: .leading)) {
                        GeometryReader { (geo) in
                            LazyVGrid(columns: columns,spacing: 10) {
                                ForEach(0..<(homeViewModel.notes?.count ?? 5), id:\.self) { index in
                                    if (index % 2 ) == 0 {
                                        
                                        NoteListItem(noteItem: homeViewModel.notes?[index]).frame(width:geo.size.width / 2,height: 175,alignment:.top)
                                        
                                        
                                    } else {
                                            NoteListItem(noteItem: homeViewModel.notes?[index]).frame(width:geo.size.width / 2,height: 100,alignment:.top)
                                        
                                    }
                                    
                                }.aspectRatio(1, contentMode: .fit)
                                .fixedSize(horizontal: true, vertical: false)
                        }
                        
                    }
                    }.padding([.leading,.trailing,],16.0)
                    .padding([.top,.bottom,],4)
            /*} else {
                EmptyView()
            }*/
            
            
        }.listStyle(.insetGrouped)
            .task {
                await homeViewModel.fetchAllNotes()
            }
    }
}
struct NoteListViewPreviews: PreviewProvider {
    static var previews: some View {
        NoteListView()
    }
}
