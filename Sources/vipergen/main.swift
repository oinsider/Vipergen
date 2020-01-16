import Commander
import Foundation

let date = Date()
let formatter = DateFormatter()
formatter.dateFormat = "dd/MM/yy"
let currentDate = formatter.string(from: date)
formatter.dateFormat = "yyyy"
let year = formatter.string(from: date)

let vipergenCommand = command (
    Argument<String>("module name", description: "The name of the module", validator: nil),
    Option<String>("template", default: "default", flag: nil, description: "The template (Should exist in the Templates directory)", validator: nil),
    Option<String>("creator", default: "John Doe", flag: nil, description: "The name of the creator", validator: nil),
    Option<String>("output", default: ".", flag: nil, description: "The output directory", validator: nil),
    Option<String>("projectName", default: "", flag: nil, description: "The name of the project", validator: nil),
    Option<String>("currentDate", default: currentDate, flag: nil, description: "File creation date", validator: nil),
    Option<String>("year", default: year, flag: nil, description: "Current year", validator: nil),
    Option<String>("company", default: "Foo Bar", flag: nil, description: "Creators company", validator: nil),
    Option<String>("reverseDomain", default: "", flag: nil, description: "App reverse domain", validator: nil),
    Option<String>("fileExtension", default: "swift", flag: nil, description: "Source file extension", validator: nil)
) { (moduleName: String, template: String, creator: String, output: String, projectName: String, date: String, year: String, company: String, reverseDomain: String, fileExtension: String)  in
    
    let configuration = VipergenConfiguration(moduleName: moduleName, template: template, creator: creator, outputFolder: output, projectName: projectName, date: date, year: year, company: company, reverseDomain: reverseDomain, fileExtension: fileExtension)
    let vipergen = Vipergen(withConfiguration: configuration, templateRenderer: TemplateRendererStencil())
    vipergen.generateModule()
    
}

vipergenCommand.run()
