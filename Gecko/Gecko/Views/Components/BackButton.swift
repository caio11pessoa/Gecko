//  Created by Julia Morales on 10/09/24.
//

import SwiftUI

struct BackButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.backward")
                .foregroundStyle(.blue)
        }
    }
}

#Preview {
    BackButton(action: {})
}
