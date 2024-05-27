//
//  IdentityInfoView.swift
//  PWM
//
//  Created by Davidyoon on 5/24/24.
//

import SwiftUI

struct IdentityInfoView<Model>: View where Model: IdentityInfoViewModelProtocol {
    
    @StateObject private var viewModel: Model
    
    @State private var isCarrierViewOpen: Bool = false
    
    init(viewModel: Model) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Text("본인인증을 위해\n정보를 입력해주세요")
                            .bold()
                            .font(.system(size: 24))
                        Spacer()
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 32)
                
                VStack {
                    VStack(alignment: .leading) {
                        Text("이름")
                            .font(.system(size: 14))
                        
                        TextField("이름", text: $viewModel.name)
                        
                        Divider()
                        if viewModel.hasErrorOnName {
                            Text("잘못된 이름을 입력했어요")
                                .foregroundStyle(.red)
                                .frame(height: 20)
                        } else {
                            Text("")
                                .frame(height: 20)
                        }
                    }
                    .padding(.horizontal)
                    
                    
                    VStack(alignment: .leading) {
                        Text("주민등록번호")
                            .font(.system(size: 14))
                        
                        HStack {
                            TextField(text: $viewModel.frontRegistrationNumber) {
                                Text("생년월일 6자리")
                            }
                            .onChange(of: viewModel.frontRegistrationNumber) { newValue in
                                if newValue.count > 0 {
                                    viewModel.frontRegistrationNumber = String(newValue.prefix(6))
                                }
                            }
                            .frame(width: 170)
                            
                            Text("-")
                            
                            HStack(spacing: 0) {
                                TextField(text: $viewModel.backRegistrationNumber) {
                                    Text("●")
                                }
                                .onChange(of: viewModel.backRegistrationNumber) { newValue in
                                    if newValue.count > 0 {
                                        viewModel.backRegistrationNumber = String(newValue.prefix(1))
                                    }
                                }
                                .frame(width: 16)
                                Text("●●●●●●")
                            }
                        }
                        
                        Divider()
                        
                    }
                    .padding(.horizontal)
                    .padding(.top, 24)
                    
                    VStack(alignment: .leading) {
                        Text("통신사")
                            .font(.system(size: 14))
                        Button(action: {
                            isCarrierViewOpen.toggle()
                        }, label: {
                            Text("")
                            Spacer()
                            Image("ic_arrow_down_grey")
                        })
                        .frame(height: 28)
                        
                        Divider()
                        
                    }
                    .padding(.horizontal)
                    .padding(.top, 24)
                    
                    VStack(alignment: .leading) {
                        Text("휴대폰번호")
                            .font(.system(size: 14))
                        
                        TextField(text: $viewModel.phoneNumber) {
                            Text("예) 01012345678")
                        }
                        
                        Divider()
                        
                    }
                    .padding(.horizontal)
                    .padding(.top, 24)
                    
                }
            }
            .sheet(isPresented: $isCarrierViewOpen) {
                CarrierView(viewModel: viewModel, isOpened: $isCarrierViewOpen)
            }
            Button(action: {
                
            }, label: {
                Text("다음")
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .foregroundStyle(.white)
                    .background(.black)
            })
            .padding()
        }
    }
}

#Preview {
    IdentityInfoView(viewModel: IdentityInfoViewModel())
}
