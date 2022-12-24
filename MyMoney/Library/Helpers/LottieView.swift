//
//  LottieView.swift
//  MyMoney
//
//  Created by Elvina Shamoi on 24/12/22.
//

import SwiftUI
import Lottie
import SnapKit

enum LottieAnimType: String {
    case empty_face = "empty-face"
}

struct LottieView: UIViewRepresentable {
    var animationType: LottieAnimType
    let animationView = AnimationView()
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView()
        let animation = Animation.named(animationType.rawValue)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.backgroundBehavior = .pauseAndRestore
        animationView.loopMode = .loop
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)

        animationView.snp.makeConstraints { make in
            make.height.width.equalToSuperview()
        }
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {}
}

struct LottieView_Previews: PreviewProvider {
    static var previews: some View {
        LottieView(animationType: .empty_face)
    }
}
