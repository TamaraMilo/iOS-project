//
//  AppController.swift
//  praksamoneymanagement
//
//  Created by Webelinx Praksa 1  on 01/03/2022.
//

import Foundation
import CoreData

class AppController
{
    var colors = [String]()
    var icons = [String]()
    
    
    static var controller =
    {
        return AppController()
    }()

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MoneyManagementDB")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error
            {
                print(error)
            }
        }
        
        return container
    }()
    
    func saveContext()
    {
        let context = persistentContainer.viewContext
        if context.hasChanges
        {
            do
            {
                try context.save()
            }
            catch{
                print(error)
            }
        }
    }
    
    func deleteContext(obj: NSManagedObject)
    {
        persistentContainer.viewContext.delete(obj)
        saveContext()
    }
    
    init()
    {
        fillCategories()
        
        colors = loadColors()
        icons = loadIcons()
        
    }
    
    func fillCategories()
    {
        
        do
        {
            let categories = try persistentContainer.viewContext.fetch(Category.fetchRequest())
            
            if categories.isEmpty
            {
                let categoryRent = Category(context: persistentContainer.viewContext)
                categoryRent.id = UUID()
                categoryRent.name = "Rent"
                categoryRent.icon = "house"
                categoryRent.color = "#017bff"
                categoryRent.isCustom = false
                
                let transaction1 = Transaction(context: persistentContainer.viewContext)
                transaction1.amount = 50
                transaction1.name = "Prva transakcija"
                transaction1.isIncome = true
                
                let transaction2 = Transaction(context: persistentContainer.viewContext)
                transaction1.amount = 100
                transaction1.name = "Druga transakcija"
                transaction1.isIncome = false
                
                categoryRent.addToTransaction(transaction1)
                categoryRent.addToTransaction(transaction2)
                
                let categoryGroceries = Category(context: persistentContainer.viewContext)
                categoryGroceries.id = UUID()
                categoryGroceries.name = "Groceries"
                categoryGroceries.icon = "cart"
                categoryGroceries.color = "#ff9381"
                categoryGroceries.isCustom = false
                
                let transaction3 = Transaction(context: persistentContainer.viewContext)
                transaction3.amount = 150
                transaction3.name = "Treca transakcija"
                transaction3.isIncome = true
                
                let transaction4 = Transaction(context: persistentContainer.viewContext)
                transaction4.amount = 150
                transaction4.name = "Cetvrta transakcija"
                transaction4.isIncome = false
                
                
                categoryGroceries.addToTransaction(transaction3)
                categoryGroceries.addToTransaction(transaction4)
                
                let categoryGasoline = Category(context: persistentContainer.viewContext)
                categoryGasoline.id = UUID()
                categoryGasoline.name = "Gasoline"
                categoryGasoline.icon = "bolt.car"
                categoryGasoline.color = "#aacf63"
                categoryGasoline.isCustom = false
                
                let categoryCar = Category(context: persistentContainer.viewContext)
                categoryCar.id = UUID()
                categoryCar.name = "Car"
                categoryCar.icon = "car"
                categoryCar.color = "#f5c942"
                categoryCar.isCustom = false
                
                let transaction5 = Transaction(context: persistentContainer.viewContext)
                transaction5.amount = 80
                transaction5.name = "Peta transakcija"
                transaction5.isIncome = true
                
                let transaction6 = Transaction(context: persistentContainer.viewContext)
                transaction6.amount = 200
                transaction6.name = "Sesta transakcija"
                transaction6.isIncome = false
                
                categoryCar.addToTransaction(transaction5)
                categoryCar.addToTransaction(transaction6)
                
                let categoryLoan = Category(context: persistentContainer.viewContext)
                categoryLoan.id = UUID()
                categoryLoan.name = "Loan"
                categoryLoan.icon = "banknote"
                categoryLoan.color = "#39c0c7"
                categoryLoan.isCustom = false
                
                let categoryGift = Category(context: persistentContainer.viewContext)
                categoryGift.id = UUID()
                categoryGift.name = "Gifts"
                categoryGift.icon = "gift"
                categoryGift.color = "#f34970"
                categoryGift.isCustom = false
                
                saveContext()
        
            }
            
        }
        catch{}
        
    }
    
    func loadColors()-> [String]
    {
        var colors = [String]()
        
        if let url = Bundle.main.url(forResource: "colors", withExtension: "json")
        {
            if let data = try? Data(contentsOf: url)
            {
                do
                {
                    colors = try JSONDecoder().decode([String].self, from: data)
                }
                catch{}
            }
        }
        
        return colors
    }
    
    func loadIcons()-> [String]
    {
        var icons = [String]()
        
        if let url = Bundle.main.url(forResource: "icons", withExtension: "json")
        {
            if let data = try? Data(contentsOf: url)
            {
                do
                {
                    icons = try JSONDecoder().decode([String].self, from: data)
                }
                catch{}
            }
        }
        return icons
    }
}
