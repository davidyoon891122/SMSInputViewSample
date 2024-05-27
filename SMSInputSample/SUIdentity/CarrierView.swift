//
//  CarrierView.swift
//  PWM
//
//  Created by Davidyoon on 5/24/24.
//

import SwiftUI

struct CarrierView<Model>: View where Model: IdentityInfoViewModelProtocol {
    
    @ObservedObject var viewModel: Model
    @Binding var isOpened: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("통신사 선택")
                    .bold()
                    .font(.system(size: 20))
                Spacer()
                Button(action: {
                    print("Did tap close button ")
                    isOpened.toggle()
                }, label: {
                    Image("ic_close")
                })
            }
            .padding(.top, 12)
            
            Button(action: {
                print("SK")
            }, label: {
                Text("SK")
                    .font(.system(size: 16))
                Spacer()
            })
            .frame(maxWidth: .infinity)
            .tint(.black)
            .padding(.top, 12)
            Button(action: {
                print("KT")
            }, label: {
                Text("KT")
                    .font(.system(size: 16))
                Spacer()
            })
            .frame(maxWidth: .infinity)
            .tint(.black)
            .padding(.top, 12)
            Button(action: {
                print("LG")
            }, label: {
                Text("LG")
                    .font(.system(size: 16))
                Spacer()
            })
            .frame(maxWidth: .infinity)
            .tint(.black)
            .padding(.top, 12)
        }
        .padding(.horizontal)
        .ignoresSafeArea()
        .presentationDetents([.fraction(0.25)])
    }
}

@available(iOS 16.0, *)
#Preview {
    CarrierView(viewModel: IdentityInfoViewModel(), isOpened: .constant(false))
}
