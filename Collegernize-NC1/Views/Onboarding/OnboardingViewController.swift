//
//  OnboardingViewController.swift
//  Collegernize-NC1
//
//  Created by Hanz Christian on 27/04/22.
//

import UIKit

class OnboardingViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var textLabel: UILabel!
    
    var slides:[OnboardingSlide] = [] //array untuk nampung data
    var currentPage = 0 {
        didSet{
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1{
                nextBtn.setTitle("Let's Go!", for: .normal)
            }
            else{
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }//page yang sedang diamati{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = [
            OnboardingSlide(title: "Introduction", description: "Organize your collage activities\nNo stress.No depress. Be success", image: UIImage(imageLiteralResourceName: "Human")),
            OnboardingSlide(title: "Personal Notes", description: "An easy access notes which will help\nyou determine what to do each day!", image: UIImage(imageLiteralResourceName: "Calendar")),
            OnboardingSlide(title: "Static Schedule", description: "Set you daily routine and never forget about\n your daily schedule!", image: UIImage(imageLiteralResourceName: "Clock"))
        ]
        
    }
    

    @IBAction func nextBtnClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1{ //last page
            //segue ke home
            let controller = storyboard?.instantiateViewController(withIdentifier: "HomePageController") as! UIViewController
            controller.modalPresentationStyle = .fullScreen //mengatur presentasi next view
            controller.modalTransitionStyle = .flipHorizontal //mengatur hasil transisi next view
            present(controller,animated: true,completion: nil)
            
        }
        else{
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }

    }

}

extension OnboardingViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        
        cell.setup(slide: slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
