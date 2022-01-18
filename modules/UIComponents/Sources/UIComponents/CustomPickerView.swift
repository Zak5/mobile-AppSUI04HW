//
//  CustomPickerView.swift
//  
//
//  Created by Konstantin Zaharev on 19.12.2021.
//

import SwiftUI

public protocol CustomPickerItemProtocol: Hashable {
    var label: String { get }
}

public struct CustomPickerView<Item>: View where Item: CustomPickerItemProtocol {
    
    @Binding var selected: Item
    private var items: [Item]
    private var handler: () -> ()
    
    @Namespace private var ns

    public init(items: [Item], selected: Binding<Item>, handler: @escaping () -> () ) {
        self.items = items
        self._selected = selected
        self.handler = handler
    }

    public var body: some View {
        VStack {
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                ScrollViewReader { scrollView in
                    
                    HStack {
                        
                        ForEach(items, id: \.self) { item in
                            if item == selected {
                                ZStack() {
                                    Text(item.label)
                                        .bold()
                                        .layoutPriority(1)
                                    VStack() {
                                        Rectangle().frame(height: 2)
                                            .padding(.top, 20)
                                    }
                                    .matchedGeometryEffect(id: "animation", in: ns)
                                }
                            } else {
                                Text(item.label)
                                    .onTapGesture {
                                        withAnimation {
                                            selected = item
                                            scrollView.scrollTo(item)
                                            handler()
                                        }
                                    }
                            }
                        }
                    }
                    .padding(.leading, 10)
                    .padding(.trailing, 20)
                }
            }
        }
        .padding()
    }
    
}

struct CustomPickerView_Previews: PreviewProvider {
    
    enum Item: CaseIterable, CustomPickerItemProtocol {
        case item1, item2, item3

        var label: String {
            get {
                switch self {
                case .item1:
                    return "Item1"
                case .item2:
                    return "Item2"
                case .item3:
                    return "Item3"
                }
            }
        }
    }
    
    @State static var items: [Item] = []
    @State static var selected: Item = .item1
    
    static var previews: some View {
        CustomPickerView(items: Item.allCases, selected: $selected) {
            print("On change")
        }
    }
}
