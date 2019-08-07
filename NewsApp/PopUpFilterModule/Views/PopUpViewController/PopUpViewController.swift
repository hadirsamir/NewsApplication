//
//  PobUpViewController.swift
//  NewsApp
//
//  Created by ASamir on 7/30/19.
//  Copyright © 2019 Samir. All rights reserved.
//

import UIKit
import RxSwift
import ProgressHUD
class PopUpViewController: UIViewController {
    //MARK:- IBOutlets
    @IBOutlet weak var countryTextField  : UITextField!
    @IBOutlet weak var sourceTextField   : UITextField!
    @IBOutlet weak var closeBtn : UIButton!
    @IBOutlet weak var filterBtn :UIButton!
    @IBOutlet weak var checkCountryBtn : UIButton!
    @IBOutlet weak var checkSourceBtn   : UIButton!
    @IBOutlet weak var filterMainView : UIView!
    
    //MARK:- Objects
    let theCountryPicker = UIPickerView()
    let theSourcePicker = UIPickerView()
    let disposeBag = DisposeBag()
    let sourcesViewModel = SourcesViewModel()
    var sourceObject : NewsSourceResponseModel = NewsSourceResponseModel()
    var sourcesArray :[SourcesModel] = [SourcesModel]()
    var chosenCountry : String = ""
    var chosenSource  : String = ""
    public weak var delegate : sendDataToViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set textFields inputView from pickers
        countryTextField.inputView = theCountryPicker
        sourceTextField.inputView  = theSourcePicker
        theCountryPicker.delegate = self
        theSourcePicker.delegate  = self
        self.filterMainView.setCornerReduis()
        initListeners()
        callData()
        checkSourceBtn.setBtnImage(btnImage: "un_checked_sign")
        checkCountryBtn.setBtnImage(btnImage: "un_checked_sign")
        // set Vc transparent Background
        self.view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.8)
        
    }
    
    // listen to to subject event (observer)
    fileprivate func initListeners(){
        self.sourcesViewModel.objSourceRemoteObservable.asObservable().subscribe(onNext: { (sourceResponse) in
            self.sourceObject = sourceResponse
            self.sourcesArray.append(contentsOf:sourceResponse.sources)
        }, onError: { (error) in
        }, onCompleted: {
        }).disposed(by: self.disposeBag)
    }
    
    fileprivate func callData(){
        self.sourcesViewModel.getSourceData()
        
    }
    // remove popup view from parent view
    @IBAction func closePopUp(){
        self.view.removeFromSuperview()
    }
    @IBAction func closeView(){
        closePopUp()
    }
    
    // set conditions to filter criteria to choose only one option
    @IBAction func filterAction(){
        if checkSourceBtn.isSelected == false && checkCountryBtn.isSelected == false  || (checkSourceBtn.isSelected == true && chosenSource.isEmpty
            || (checkCountryBtn.isSelected == true && chosenCountry.isEmpty)){
            // show error message
            ProgressHUD.showError("Please choose a country or a news source!")
            self.view.endEditing(true)
            return
        }
        if checkCountryBtn.isSelected == true {
            self.delegate?.sendDataToMainVC(filterType: .COUNTRY, stringCode: chosenCountry)
        }else if checkSourceBtn.isSelected == true {
            self.delegate?.sendDataToMainVC(filterType: .SOURCE, stringCode: chosenSource)
        }
        
        closePopUp()
    }
    // radio btns actions
    @IBAction func selectCountryBtn(){
        self.btnSelection(firstBtn: checkCountryBtn, secondBtn: checkSourceBtn, selectedTxtField: sourceTextField)
    }
    @IBAction func selectSourceBtn(){
        self.btnSelection(firstBtn: checkSourceBtn, secondBtn: checkCountryBtn, selectedTxtField: countryTextField)
    }
}
extension PopUpViewController :UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case theCountryPicker:
            return NewsConstants.countryArray.count
        case theSourcePicker :
            return sourcesArray.count
        default:
            return 0
        }
    }
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case theCountryPicker:
            return NewsConstants.countryArray[row]
        case theSourcePicker:
            return sourcesArray[row].name
        default:
            return nil
        }
    }
    // set text fields data after selecting a value from country and source pickers
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case theCountryPicker:
            countryTextField.text = NewsConstants.countryArray[row]
            self.chosenCountry = NewsConstants.countryArray[row]
            self.btnSelection(firstBtn: checkCountryBtn, secondBtn: checkSourceBtn, selectedTxtField: sourceTextField)
        case theSourcePicker:
            sourceTextField.text  = sourcesArray[row].name
            self.chosenSource = sourcesArray[row].id
            self.btnSelection(firstBtn: checkSourceBtn, secondBtn: checkCountryBtn, selectedTxtField: countryTextField)
        default:
            print("nil")
        }
        self.view.endEditing(true)
    }
    // set btns images and selection modes after selection of one of them
    func btnSelection(firstBtn : UIButton , secondBtn : UIButton,selectedTxtField: UITextField){
        firstBtn.setBtnImage(btnImage: "checked_sign")
        firstBtn.isSelected = true
        secondBtn.isSelected = false
        secondBtn.setBtnImage(btnImage: "un_checked_sign")
        selectedTxtField.text = ""
        
    }
}

