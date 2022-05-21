//
//  LocalDataModel.swift
//  Sporty
//
//  Created by  Hager Magdy on 5/19/22.
//  Copyright © 2022 iti. All rights reserved.
//
import UIKit
import CoreData
import Foundation
class LocalDataModel {
    let appdelegate :AppDelegate?
     var viewContext : NSManagedObjectContext?
    
    init(){
         appdelegate = UIApplication.shared.delegate as! AppDelegate
        
        viewContext = appdelegate?.persistentContainer.viewContext
    }
    
    func Add(leagueInput: League){
      print("AddMethod")
        print(leagueInput ,"input")
        let entity = NSEntityDescription.entity(forEntityName: "LeagueE", in: viewContext!
        )
//self.movSelect.forEach{(i) in
    let leagueObj = NSManagedObject(entity: entity!, insertInto: viewContext)
        leagueObj.setValue(leagueInput.idLeague, forKey: "id")
        leagueObj.setValue(leagueInput.strLeague,forKey: "strLeague")
        leagueObj.setValue(leagueInput.strBadge, forKey: "strImage")
        leagueObj.setValue(leagueInput.strYoutube, forKey: "strYoutube")
            do{
                try viewContext!.save()
            print("Inserted sucsseflyyyyy")
             print(leagueObj)
                appdelegate!.saveContext()
        }catch let _{
       print ("can't insert")
        }
    }
   /* func fetchLeagues() -> [League]{
/*let request = NSFetchRequest<LeagueDB>(entityName: "LeagueDB")
        var  result : [LeagueDB] = []
        do{
            result = try managedContext.fetch(request)
        }catch let error{
            print(error.localizedDescription)
        }
        return result*/
       /*  var  result : [League] = []
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "LeagueE")
                           do{
                            let returnedLeagues = try viewContext?.fetch(fetchRequest)
                               
                            print(returnedLeagues?.count, "fetchhhh")
                            for i in stride(from: 0, to: returnedLeagues?.count ?? 0, by: 1){
                                
                                var item = League(from: <#Decoder#>)
                                
                            }
                                }catch let error{
            print(error.localizedDescription)
        }
        return result
        */
    }
    
    */
    
    
    
    
    
}
