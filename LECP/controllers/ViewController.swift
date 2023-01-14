//
//  ViewController.swift
//  LECP
//
//  Created by Luis Eduardo Cordova Pichardo on 11/01/23.
//

import Foundation
import UIKit
import SkeletonView
import MapKit

class ViewController: UIViewController {
    
    var urlImage: String = ""

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var registeredLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var userImageViewImage: UIImageView!
    
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var natLabel: UILabel!
    @IBOutlet weak var dniLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var coordinatesLabel: UILabel!
    @IBOutlet weak var postCodeLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var uudiLabel: UILabel!
    @IBOutlet weak var timeZoneLabel: UILabel!
    
    @IBOutlet weak var sha256Label: UILabel!
    @IBOutlet weak var sha1Label: UILabel!
    @IBOutlet weak var md5Label: UILabel!
    @IBOutlet weak var saltLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        callAPI()
        
        setUpSkeleton()
        setAnimation()
    }
    
    

    
    
    func callAPI(){
        guard let url = URL(string: "https://randomuser.me/api/") else{
            return
        }

         let task = URLSession.shared.dataTask(with: url){
             data, response, error in
             
             
             let decoder = JSONDecoder()

             if let data = data{
                 do{
                     let user = try decoder.decode(User.self, from: data)
                     
                     DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                         
                         self.stopAnimation()
                         self.loadInfo(user: user)
                     }

                 }catch{
                     print(error)
                 }
             }
         }
         task.resume()
    }
    
    func loadInfo(user: User){
        self.genderLabel.text = user.results[0].gender
        self.nameLabel.text = user.results[0].name.title! + " " + user.results[0].name.first! + " " + user.results[0].name.last!
        self.emailLabel.text = user.results[0].email
        self.dobLabel.text = user.results[0].dob.date
        self.ageLabel.text = user.results[0].dob.age?.description
        self.registeredLabel.text = user.results[0].registered.date
        self.phoneLabel.text = user.results[0].phone
        self.cellLabel.text = user.results[0].cell
        self.dniLabel.text = user.results[0].id.name! + " " + (user.results[0].id.value ?? "")
        self.natLabel.text = user.results[0].nat
        self.streetLabel.text = user.results[0].location.street.name! + " " + user.results[0].location.street.number!.description
        self.cityLabel.text = user.results[0].location.city
        self.stateLabel.text = user.results[0].location.state
        self.coordinatesLabel.text = user.results[0].location.coordinates.latitude! + " " + user.results[0].location.coordinates.longitude!
        self.countryLabel.text = user.results[0].location.country
        self.postCodeLabel.text = user.results[0].location.postCode?.description ?? "N/A"
        self.timeZoneLabel.text = user.results[0].location.timezone.description! + " " + user.results[0].location.timezone.offset!
        self.uudiLabel.text = user.results[0].login.uuid
        self.userNameLabel.text = user.results[0].login.username
        self.passwordLabel.text = user.results[0].login.password
        self.saltLabel.text = user.results[0].login.salt
        self.md5Label.text = user.results[0].login.md5
        self.sha1Label.text = user.results[0].login.sha1
        self.sha256Label.text = user.results[0].login.sha256
        
        DispatchQueue.global().async {
            self.urlImage = user.results[0].picture.large!
            self.userImageViewImage.loadFromUrl(url: URL(string: user.results[0].picture.medium!)!)
        }
    }
    
    
    @IBAction func gotoImage(_ sender: Any) {
        
        performSegue(withIdentifier: "goToImage", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToImage"){
            let vc = segue.destination as! ImageViewController
            vc.imageUrl = self.urlImage
            
        }
    }
    
    func setAnimation(){
        nameLabel.showAnimatedGradientSkeleton()
        dobLabel.showAnimatedGradientSkeleton()
        registeredLabel.showAnimatedGradientSkeleton()
        phoneLabel.showAnimatedGradientSkeleton()
        cellLabel.showAnimatedGradientSkeleton()
        ageLabel.showAnimatedGradientSkeleton()
        stateLabel.showAnimatedGradientSkeleton()
        cityLabel.showAnimatedGradientSkeleton()
        streetLabel.showAnimatedGradientSkeleton()
        natLabel.showAnimatedGradientSkeleton()
        dniLabel.showAnimatedGradientSkeleton()
        emailLabel.showAnimatedGradientSkeleton()
        countryLabel.showAnimatedGradientSkeleton()
        coordinatesLabel.showAnimatedGradientSkeleton()
        postCodeLabel.showAnimatedGradientSkeleton()
        genderLabel.showAnimatedGradientSkeleton()
        uudiLabel.showAnimatedGradientSkeleton()
        timeZoneLabel.showAnimatedGradientSkeleton()
        userImageViewImage.showAnimatedGradientSkeleton()
    }
    
    func stopAnimation(){
        nameLabel.hideSkeleton()
        dobLabel.hideSkeleton()
        registeredLabel.hideSkeleton()
        phoneLabel.hideSkeleton()
        cellLabel.hideSkeleton()
        ageLabel.hideSkeleton()
        stateLabel.hideSkeleton()
        cityLabel.hideSkeleton()
        streetLabel.hideSkeleton()
        natLabel.hideSkeleton()
        dniLabel.hideSkeleton()
        emailLabel.hideSkeleton()
        countryLabel.hideSkeleton()
        coordinatesLabel.hideSkeleton()
        postCodeLabel.hideSkeleton()
        genderLabel.hideSkeleton()
        uudiLabel.hideSkeleton()
        timeZoneLabel.hideSkeleton()
    }
    
    func setUpSkeleton(){
        nameLabel.isSkeletonable = true
        dobLabel.isSkeletonable = true
        registeredLabel.isSkeletonable = true
        phoneLabel.isSkeletonable = true
        cellLabel.isSkeletonable = true
        ageLabel.isSkeletonable = true
        stateLabel.isSkeletonable = true
        cityLabel.isSkeletonable = true
        streetLabel.isSkeletonable = true
        natLabel.isSkeletonable = true
        dniLabel.isSkeletonable = true
        emailLabel.isSkeletonable = true
        countryLabel.isSkeletonable = true
        coordinatesLabel.isSkeletonable = true
        postCodeLabel.isSkeletonable = true
        genderLabel.isSkeletonable = true
        uudiLabel.isSkeletonable = true
        timeZoneLabel.isSkeletonable = true
        userImageViewImage.isSkeletonable = true
        
        
    }
    
    
}

extension UIImageView{
    func loadFromUrl(url: URL){
        if let data = try? Data(contentsOf: url){
            if let imageUrl = UIImage(data: data){
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.image = imageUrl
                    self.hideSkeleton()
                }
            }
      }
    }
}


