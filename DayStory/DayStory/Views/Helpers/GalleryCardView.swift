//
//  GalleryCardView.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 1.06.2024.
//

import SwiftUI

struct GalleryCardView: View {
    
    let summary: ImageModel?
    var isPlaceHolder = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text(getDateComponents(for: summary?.date ?? "", component: .day))
                    .font(.system(size: 25))
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                
                VStack(alignment: .leading) {
                    Text(getDateComponents(for: summary?.date ?? "", component: .weekday))
                        .font(.system(size: 10))
                        .foregroundStyle(.black)
                    
                    Text(getDateComponents(for: summary?.date ?? "", component: .month))
                        .font(.system(size: 12))
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                }
            }
            
            if isPlaceHolder {
                placeHolderView
            } else {
                imageView
            }
        }
        .padding(3)
        .overlay {
            RoundedRectangle(cornerRadius: 4)
                .stroke(lineWidth: 1)
                .foregroundStyle(.cardBorder)
        }
    }
}

// MARK: - Views
private extension GalleryCardView {
    func getDateComponents(for dateString: String, component: Calendar.Component) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        guard let date = dateFormatter.date(from: dateString) else { return "" }
        
        let calendar = Calendar.current
        let value = calendar.component(component, from: date)
        
        let dateFormatter2 = DateFormatter()
        dateFormatter2.locale = Locale(identifier: "tr_TR")
        
        switch component {
        case .day:
            return "\(value)"
        case .weekday:
            dateFormatter2.dateFormat = "EEEE"
        case .month:
            dateFormatter2.dateFormat = "MMMM"
        default:
            return ""
        }
        
        return dateFormatter2.string(from: date)
    }
    
    var placeHolderView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .fill(Color.galleryPlaceholderGray)
                .frame(width: 100, height: 100)
            
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundStyle(.dayStoryPurple)
        }
    }
    
    var imageView: some View {
        AsyncImage(url: URL(string: summary?.imagePath ?? "")) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
        } placeholder: {
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
        }
    }
}

#Preview {
    GalleryCardView(summary: ImageModel(id: 0, date: "18-09-2001", imagePath: ""))
}
