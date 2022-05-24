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
    
    func Add(leagueInput: FavourieLeague){
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
   func fetchLeagues() -> [FavourieLeague]{
print("fetchhhhMethod")
        var  result : [FavourieLeague] = []
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "LeagueE")
                           do{
                            let returnedLeagues = try viewContext?.fetch(fetchRequest)
                               
                            print(returnedLeagues?.count, "fetchhhh")
                            for i in stride(from: 0, to: returnedLeagues?.count ?? 0, by: 1){
                                 
                                var item = FavourieLeague()
                                item.idLeague = returnedLeagues?[i].value(forKey : "id") as! String
                                item.strLeague = returnedLeagues?[i].value(forKey : "strLeague") as! String
                                item.strBadge = returnedLeagues?[i].value(forKey : "strImage") as! String
                                item.strYoutube = returnedLeagues?[i].value(forKey : "strYoutube") as! String
                                result.append(item)
                                
                            }
                                }catch let error{
            print(error.localizedDescription)
        }
        return result
        
    }
    
  func deleteLeague(withID: String) {
    print("delete",withID)
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "LeagueE")
        fetchRequest.predicate = NSPredicate.init(format: "id =='\(withID)'")
         do{
                let result = try viewContext?.fetch(fetchRequest)
                                      
                                 
                for object in result! {
                       print("deletedsucsseflyyyyy")
                    viewContext!.delete(object)
                }
                                    }catch let error{
                   print(error.localizedDescription)
      
    }
     appdelegate!.saveContext()
    }
    
    func isFavorite(league : FavourieLeague) -> Bool {
        var isFavorite = false
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "LeagueE")
        fetchRequest.fetchLimit =  1
        fetchRequest.predicate = NSPredicate(format: "id == %@" ,league.idLeague)
        
        do {
            let count = try viewContext?.count(for: fetchRequest)
            if count! > 0 {
                isFavorite =  true
            }
        }catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return isFavorite
    }
    
    
    
}
