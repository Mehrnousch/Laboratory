//
//  SelectSlotCollectionView.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 21.07.22.
//

import Foundation
import Foundation
import SwiftFoundation
import UIKit

class SelectSlotCollectionView: UIViewController {
    let dateCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    let dateList = ["01.02.2022","02.02.2022","03.02.2022","04.02.2022","05.02.2022","06.02.2022","07.02.2022","08.02.2022","09.02.2022", "10.02.2022", "11.02.2022"]
    let timeList = ["08:00","09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00"]
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDefaults()
        setupUI()
        setupLayout()
    }
}

//MARK: -CollectionViewDataSource
extension SelectSlotCollectionView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       
        if dateList.isEmpty {
            return 0
        }
        else {
            dateCollectionView.backgroundView  = .none
            return dateList.count
        }
     
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if timeList.isEmpty {
            return 0
        }
        else {
            dateCollectionView.backgroundView  = .none
            return timeList.count
        }
    }
   

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "timeCell", for: indexPath)as! LaboratorReservationcollectionViewCell
        let time = timeList[indexPath.row]
       myCell.setupCell(data: time)
        
        myCell.isSelected = false
        myCell.layer.borderColor = .init(red: 0.1, green: 0.3, blue: 0.9, alpha: 0.1)
        myCell.layer.borderWidth = 2
       
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .left)
            myCell.isSelected = true
        
            return myCell
        }
    
        
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
             let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! SectionHeader
            
            let date = dateList[indexPath.row]
           sectionHeader.setupCell(data: date)
               
             return sectionHeader
        }
             return UICollectionReusableView()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 64)
    }
   
   
}

// MARK: - UICollectionViewDelegate
extension SelectSlotCollectionView: UICollectionViewDelegate {
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                print("User tapped on item in cell \(indexPath)")
            let vc = ReservationControllViewController()
            self.navigationController?.pushViewController(vc, animated: true)
                
            }
    }


// MARK: - UICollectionViewDelegateFlowLayout

extension SelectSlotCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
    UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let padding: CGFloat =  200
      let collectionViewSize = dateCollectionView.frame.size.width - padding
      return CGSize(width: collectionViewSize/2, height: collectionViewSize/3)
    }
    
}
//MARK: -Setup
extension SelectSlotCollectionView {
    
    func setupDefaults() {
        dateCollectionView.register(LaboratorReservationcollectionViewCell.self, forCellWithReuseIdentifier: "timeCell")
      dateCollectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        
    }
 
    private func setupUI() {
        
        if let flowLayout = dateCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .vertical
        }

        view.addSubviews(dateCollectionView)
        dateCollectionView.dataSource = self
        dateCollectionView.delegate = self
        title = "Choose an appointment"
        view.backgroundColor = .systemBackground
        dateCollectionView.backgroundColor = .systemBackground
        dateCollectionView.translatesAutoresizingMaskIntoConstraints = false
      
      
    }
    
    private func setupLayout() {
        dateCollectionView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20).isActive = true
        dateCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        dateCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        dateCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        dateCollectionView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
       
        
   let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
       layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
       layout.itemSize = CGSize(width: 0, height: 0)
        
       
}
    
}

