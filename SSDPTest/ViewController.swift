//
//  ViewController.swift
//  SSDPTest
//

import UIKit
import os
import TinySSDP

class ViewController: UIViewController {
    
    var searchSession: SSDPSearchSession?
    
    var foundServices = [SSDPService]()
    
    @IBOutlet var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func buttonTapped() {
        os_log("buttonTapped")
        
        searchSession?.stopSearch()
        
        searchSession = DefaultSearchSessionFactory().mediaServerSearchSession()
        searchSession?.delegate = self
        searchSession?.startSearch()
        
    }
}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foundServices.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceCellIdentifier")! as UITableViewCell
        
        let service = foundServices[indexPath.row]
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel?.text = service.server
        
        
        return cell
    }
}



extension ViewController: SSDPSearchSessionDelegate {
    func searchSession(_ searchSession: SSDPSearchSession, didFindService service: SSDPService) {
        if #available(iOS 12.0, *) {
            os_log(.info, "didFindService %@", service.debugDescription)
        }
        
        DispatchQueue.main.async {
            self.foundServices.insert(service, at: 0)
                   self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .top)
               }
    }
    
    func searchSession(_ searchSession: SSDPSearchSession, didEncounterError error: SSDPSearchSessionError) {
        if #available(iOS 12.0, *) {
            os_log(.error, "didEncounterError %@", error as CVarArg)
        }
    }
    
    func searchSessionDidStopSearch(_ searchSession: SSDPSearchSession, foundServices: [SSDPService]) {
        if #available(iOS 14.0, *) {
            os_log(.info, "searchSessionDidStopSearch \(foundServices.debugDescription)")
        }
    }
    
    
}

