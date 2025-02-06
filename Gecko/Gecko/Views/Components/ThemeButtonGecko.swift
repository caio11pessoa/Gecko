import SwiftUI

struct ThemeButtonGecko: View {
    
    let title: String
    let iconName: String
    let action: () -> Void
    @State var isSelected: Bool = false
    
    var buttonContent: some View {
        VStack(spacing: 10) {
            Group{
                Image(systemName: iconName)
                    .font(.system(size: 42))
                Text(title)
                    .font(.system(size: 18))
            }
            .foregroundStyle(isSelected ? Color("IconsThemeColorGeckoSelected") : Color("IconsThemeColorGeckoUnselected"))
        }
        .padding(.bottom , isSelected ? 2 : 0)
    }
    
    var body: some View {
        Image(isSelected ? "ThemeButtonGeckoSelected" : "ThemeButtonGeckoUnselected")
            .overlay {
                ZStack {
                    ZStack {
                        Image("SelectIcon")
                            .opacity(isSelected ? 1 : 0)
                    }
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity,
                        alignment: .topTrailing
                    )
                    .padding(8)
                    buttonContent
                }
            }
            .onTapGesture {
                withAnimation {
                    isSelected.toggle()
                }
            }
    }
}
#Preview {
    VStack{
        Group{
            ThemeButtonGecko(title: "Marcos", iconName: "map.fill", action: {})
            ThemeButtonGecko(title: "Marcos", iconName: "dog.fill", action: {})
        }
        .frame(width: 144, height: 144)
    }
}
