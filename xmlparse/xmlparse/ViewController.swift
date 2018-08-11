//
//  ViewController.swift
//  xmlparse
//
//  Created by TOPS on 7/19/18.
//  Copyright © 2018 dp. All rights reserved.
//

import UIKit

class ViewController: UIViewController,XMLParserDelegate,UITableViewDelegate,UITableViewDataSource {
    var arr:[Any] = [];
    var brr:[Any] = [];
    var strcontent = "";
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://timesofindia.indiatimes.com/rssfeeds/1898055.cms")
       
        do {
            let dt = try Data(contentsOf: url!)
            
            let parse = XMLParser(data: dt)
            parse.delegate = self;
            parse.parse()
            
        } catch  {
            
        }
      
}
    func parserDidStartDocument(_ parser: XMLParser) {
        arr = [];
    }
    func parserDidEndDocument(_ parser: XMLParser) {
        print(arr)
    }
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        if elementName == "item" {
            brr=[];
        }
      
    }
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "title"||elementName == "description"||elementName == "link"
        {
            brr.append(strcontent)
            print(brr)
        }
        else if elementName=="item"
        {
            arr.append(brr)
        }
        
    }
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        strcontent = string;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let  temp  = arr[indexPath.row] as! [String];
        cell.textLabel?.text = temp[0];
        cell.detailTextLabel?.text = temp[1];
        return cell;
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let stb = self.storyboard?.instantiateViewController(withIdentifier: "next") as! second
        stb.arr = arr[indexPath.row] as! [String]
        self.navigationController?.pushViewController(stb, animated: true)
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

