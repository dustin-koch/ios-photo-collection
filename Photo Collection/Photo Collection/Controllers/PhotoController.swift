//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Dustin Koch on 1/23/19.
//  Copyright © 2019 Rabbit Hole Fashion. All rights reserved.
//

import Foundation

class PhotoController {
    
    private (set) var photos: [Photo] = []
    
    func create(image imageData: Data, title: String) {
        // initializes a new instance of Photo and appends it to the photos array
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    func update(updatePhoto photo: Photo, image: Data, title: String) {
        //takes in Photo,Data, and String parameters.
        guard let index = photos.index(of: photo) else { return }
        
        var updatePhoto = photo
        updatePhoto.imageData = image
        updatePhoto.title = title
        
        photos[index] = updatePhoto
    }
    
}


//var imageData: Data
//var title: String
