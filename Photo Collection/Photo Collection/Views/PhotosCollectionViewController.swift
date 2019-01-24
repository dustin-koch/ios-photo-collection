//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Dustin Koch on 1/23/19.
//  Copyright © 2019 Rabbit Hole Fashion. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
        collectionView?.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotosCollectionViewCell
    
        // Configure the cell
        let photo = photoController.photos[indexPath.item]
        cell.imageView.image = UIImage(data: photo.imageData)
        cell.textLabel.text = photo.title
    
        return cell
    }
    
    func setTheme() {
        guard let theme = themeHelper.themePreference else { return }
        
        if theme == "Dark" {
            collectionView.backgroundColor = .gray
        } else {
            collectionView.backgroundColor = .cyan
        }
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let detailVC = segue.destination as? PhotoDetailViewController {
            detailVC.photoController = photoController
            detailVC.themeHelper = themeHelper
            
            if segue.identifier == "MoreInfo" {
                
                guard let index = collectionView?.indexPathsForSelectedItems?.first?.item else { return }
                let photo = photoController.photos[index]
                detailVC.photo = photo
                
            } else if segue.identifier == "AddPhoto"{
                // need something here?
            }
        }
        
        if let themeVC = segue.destination as? ThemeSelectionViewController {
            themeVC.themeHelper = themeHelper
        }

    }
}

//        if segue.identifier == "AddPhoto" {
//            //pass info here
//            guard let detailVC = segue.destination as? PhotoDetailViewController else { return }
//            detailVC.photoController = photoController
//            detailVC.themeHelper = themeHelper
//
//        } else if segue.identifier == "MoreInfo" {
//            //pass info here
//            guard let detailVC = segue.destination as? PhotoDetailViewController else { return }
//            guard let indexPath = collectionView.indexPathsForSelectedItems else { return }
//            let photo = photoController.photos[index]
//
//            detailVC.photoController = photoController
//            detailVC.themeHelper = themeHelper
//            //detailVC.photo = photo
//
//        } else if segue.identifier == "SelectTheme" {
//            //pass info here
//            guard let detailVC = segue.destination as? ThemeSelectionViewController else { return }
//            detailVC.themeHelper = themeHelper
//        }
