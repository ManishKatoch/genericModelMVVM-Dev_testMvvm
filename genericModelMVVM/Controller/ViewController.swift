//
//  ViewController.swift
//  genericModelMVVM
//
//  Created by STUser ramneet0001@yahoo.com on 25/06/19.
//  Copyright © 2019 abc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK:- IBOutlets
    
    @IBOutlet weak var fName, lName, address: UILabel!
    @IBOutlet weak var btn_outlet: UIButton!
    
    // MARK:- Varaibles
    
    private let apiManager = ApiManager()
    private(set) var userViewModel: UserViewModel? // We can use this model in core data or Sqlite.
    
    var searchResult: UserDetailModel? { didSet {
            guard let searchResult = searchResult else {return}
            userViewModel = UserViewModel.init(userDetailModel: searchResult)
            DispatchQueue.main.sync {
                self.updateLabels()
            }}}
    
    // MARK:- View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    
    // MARK:- IBAction
    
    @IBAction func testButton(_ sender: UIButton) {
        
        getUserDetail()
    }
    
    @IBAction func clearData(_ sender: UIButton) {
        
        fName.text = ""
        lName.text = ""
        address.text = ""
    }
    
    @IBAction func getDetailLocally(_ sender: UIButton) {
        
        self.updateLabels() // We can also get this model data from core data or Sqlite.
    }
}

// MARK:- Extension

extension ViewController {
    
    private func updateLabels() {
        
        guard let userViewModel = userViewModel else { return }
        fName.text = userViewModel.firstName
        lName.text = userViewModel.lastName
        address.text = userViewModel.address
    }
    
    private func getUserDetail() { // Used generic type model.
        
        apiManager.callApiService(urlString: api_URL_Model!.baseUrl, method: "GET", headers: [:], params: [:], typeModel: UserDetailModel.self) { (modelResponse, error) in
            
            if let error = error {
                print("Get error: \(error.localizedDescription)")
                return
            }
            guard let response = modelResponse  else { return }
            self.searchResult = response
            print(response)
            
        }
    }
}
