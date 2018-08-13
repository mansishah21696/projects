
import UIKit

class ViewController: UIViewController,XMLParserDelegate {

    
    @IBOutlet weak var txt1: UITextField!
     var strconten = "";
    
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var txt2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    
    @IBAction func btnclick(_ sender: Any) {
    
        let url = URL(string: "http://www.dneonline.com/calculator.asmx");
        
        var soapbody = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><Add xmlns=\"http://tempuri.org/\"><intA>\(txt1.text!)</intA><intB>\(txt2.text!)</intB></Add></soap:Body></soap:Envelope>"
        
        var request = URLRequest(url: url!);
        request.addValue(String(soapbody.characters.count), forHTTPHeaderField: "Content-Length");
        request.addValue("http://tempuri.org/Add", forHTTPHeaderField: "SOAPAction");
        request.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST";
        request.httpBody = soapbody.data(using: String.Encoding.utf8);
        
        let session = URLSession.shared;
        
        let datatask = session.dataTask(with: request) { (data1, resp, err) in
            
            let strresp = String(data: data1!, encoding: String.Encoding.utf8);
            
            print(strresp!);
            
             let parse = XMLParser(data: data1!)
            parse.delegate = self;
            
            parse.parse();
            
        }
        
        datatask.resume();
        
    }

    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == "AddResult" {
        
            DispatchQueue.main.async {
                
                self.lbl.text = self.strconten;
                
            }
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        strconten = string;
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

