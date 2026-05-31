//
//  GithubAppBackground}.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 30/05/26.
//

import SwiftUI

struct GithubAppBackground<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            GithubAppColor.background
                .ignoresSafeArea()
            self.content
        }
    }
}
