//
//  ViewController.swift
//  soapappdemo
//
//  Created by TOPS on 8/13/18.
//  Copyright © 2018 TOPS. All rights reserved.
//

import UIKit

class ViewController: UIViewController,XMLParserDelegate {

    @IBOutlet weak var val1: UITextField!
    
    
    @IBOutlet weak var val2: UITextField!
    
    
    @IBOutlet weak var mux: UITextField!
    @IBOutlet weak var div: UITextField!
    @IBOutlet weak var sub: UITextField!
    @IBOutlet weak var add: UITextField!
    
     var strdata = "";
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func adding (){
        
         let url = URL(string: "http://www.dneonline.com/calculator.asmx");
        
        var request = URLRequest(url: url!);
        
        let strbody = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><Add xmlns=\"http://tempuri.org/\"><intA>\(val1.text!)</intA><intB>\(val2.text!)</intB></Add></soap:Body></soap:Envelope>"
        
        request.addValue("http://tempuri.org/Add", forHTTPHeaderField: "SOAPAction");
        
        request.addValue(String(strbody.characters.count), forHTTPHeaderField: "Content-Length");
        
        request.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type");
        
        request.httpMethod = "POST";
        
        request.httpBody = strbody.data(using: String.Encoding.utf8);
        
        let session = URLSession.shared;
        
        let datatask = session.dataTask(with: request){
            (data1,resp,err) in
            
            let strrsp = String(data:data1!,encoding : String.Encoding.utf8);
            
            print(strrsp!);
            
            let parse = XMLParser(data: data1!);
            
            parse.delegate = self
            
            parse.parse()
            
        }
        datatask.resume();
        
}
    
    func subtra () {
        
        let url = URL(string: "http://www.dneonline.com/calculator.asmx");
        
        var request = URLRequest(url: url!);

        
        let subbody = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><Subtract xmlns=\"http://tempuri.org/\"><intA>\(val1.text!)</intA><intB>\(val2.text!)</intB></Subtract></soap:Body></soap:Envelope>"
        
        request.addValue("http://tempuri.org/Subtract", forHTTPHeaderField: "SOAPAction")
        
        request.addValue(String(subbody.characters.count), forHTTPHeaderField: "Content-Length");
        
        request.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type");

        request.httpMethod = "POST";
        
        request.httpBody = subbody.data(using: String.Encoding.utf8);
        
        let session = URLSession.shared;
        
        let datatask = session.dataTask(with: request){
            (data1,resp,err) in
            
            let strrsp = String(data:data1!,encoding : String.Encoding.utf8);
            
            print(strrsp!);
            
            let parse = XMLParser(data: data1!);
            
            parse.delegate = self
            
            parse.parse()
            
        }
        datatask.resume();
    }
    func multiplying ()  {
        let url = URL(string: "http://www.dneonline.com/calculator.asmx");
        
        var request = URLRequest(url: url!);
        
        
        let strbod = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><Multiply xmlns=\"http://tempuri.org/\"><intA>\(val1.text!)</intA><intB>\(val2.text!)</intB></Multiply></soap:Body></soap:Envelope>"
        
        request.addValue("http://tempuri.org/Subtract", forHTTPHeaderField: "SOAPAction")
        
        request.addValue(String(strbod.characters.count), forHTTPHeaderField: "Content-Length");
        
        request.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type");
        
        request.httpMethod = "POST";
        
        request.httpBody = strbod.data(using: String.Encoding.utf8);
        
        let session = URLSession.shared;
        
        let datatask = session.dataTask(with: request){
            (data1,resp,err) in
            
            let strrsp = String(data:data1!,encoding : String.Encoding.utf8);
            
            print(strrsp!);
            
            let parse = XMLParser(data: data1!);
            
            parse.delegate = self
            
            parse.parse()
            
        }
        datatask.resume();

    }
    
    func dividing (){
        let url = URL(string: "http://www.dneonline.com/calculator.asmx");
        
        var request = URLRequest(url: url!);
        
        
        let strbod = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><Divide xmlns=\"http://tempuri.org/\"><intA>\(val1.text!)</intA><intB>\(val2.text!)</intB></Divide></soap:Body></soap:Envelope>"
        
        request.addValue("http://tempuri.org/Subtract", forHTTPHeaderField: "SOAPAction")
        
        request.addValue(String(strbod.characters.count), forHTTPHeaderField: "Content-Length");
        
        request.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type");
        
        request.httpMethod = "POST";
        
        request.httpBody = strbod.data(using: String.Encoding.utf8);
        
        let session = URLSession.shared;
        
        let datatask = session.dataTask(with: request){
            (data1,resp,err) in
            
            let strrsp = String(data:data1!,encoding : String.Encoding.utf8);
            
            print(strrsp!);
            
            let parse = XMLParser(data: data1!);
            
            parse.delegate = self
            
            parse.parse()
            
        }
        datatask.resume();

    }
    
    @IBAction func gobtnclick(_ sender: Any) {
    
        adding();
        subtra()
        multiplying()
        dividing()
        
        

    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName=="AddResult" {
            DispatchQueue.main.async {
                self.add.text = self.strdata;
            }
        }
        if elementName=="SubtractResult" {
            DispatchQueue.main.async {
                self.sub.text = self.strdata;
            }
        }
        if elementName=="MultiplyResult" {
            DispatchQueue.main.async {
                self.mux.text = self.strdata;
            }
        }
        if elementName=="DivideResult" {
            DispatchQueue.main.async {
                self.div.text = self.strdata;
            }
        }

        
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        strdata = string;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

