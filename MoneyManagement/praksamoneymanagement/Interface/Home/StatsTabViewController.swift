//
//  StatsTabViewController.swift
//  praksamoneymanagement
//
//  Created by Webelinx Praksa 2 on 9.3.22..
//

import UIKit
import CoreData

class StatsTabViewController: UIViewController
{

    var categories = [Category]()

    @IBOutlet weak var incomeCheckButton: CheckButton!
    @IBOutlet weak var expenseCheckButton: CheckButton!
    @IBOutlet weak var statsCollectionView: UICollectionView!
    @IBOutlet weak var chartView: PieChartView!
    
    var overallIncomeSaldo: Double = 0
    var overallExpenseSaldo: Double = 0
    var categoryIncomeSaldoArray: [Double] = []  //PRocenti
    var categoryExpenseSaldoArray: [Double] = [] // Procenti
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        do
        {
            categories = try AppController.controller.persistentContainer.viewContext.fetch(Category.fetchRequest())
            
        }
        catch{}

        

        for category in categories
        {
            overallIncomeSaldo += category.saldo().0
            overallExpenseSaldo += category.saldo().1
        }
        for category in categories {
            categoryIncomeSaldoArray.append((category.saldo().0 * 100)/overallIncomeSaldo)
            categoryExpenseSaldoArray.append((category.saldo().1 * 100)/overallExpenseSaldo)
        }

        //expenseCheckButton.layer.cornerRadius = expenseCheckButton.bounds.height * 0.2
        //zincomeCheckButton.layer.cornerRadius = incomeCheckButton.bounds.height * 0.2
        
        incomeCheckButton.isSelected = true
        expenseCheckButton.isSelected = false
        incomeCheckButton.label.text = "Income"
        expenseCheckButton.label.text = "Expense"

        incomeCheckButton.checkBox.backgroundColor = .primaryColor
        incomeCheckButton.checkBox.setImage(UIImage(systemName: "checkmark"), for: .normal)
        incomeCheckButton.checkBox.tintColor = .white
        expenseCheckButton.checkBox.backgroundColor = .gray
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        redrawChart()
        
    }
    
    func redrawChart()
    {
        chartView.pieces.removeAll()
        if(incomeCheckButton.isSelected)
        {
            for i in 0 ..< categories.count
            {
                if(categoryIncomeSaldoArray[i] > 0.0) // Mozda i ne mora
                {
                    chartView.pieces.append(PieChartView.Piece.init(percent: categoryIncomeSaldoArray[i], color: categories[i].color ?? ""))
                }
            }
        }
        else
        {
            for i in 0 ..< categories.count
            {
                if(categoryExpenseSaldoArray[i] > 0.0)
                {
                    chartView.pieces.append(PieChartView.Piece.init(percent: categoryExpenseSaldoArray[i], color: categories[i].color ?? ""))
                }
            }
        }
    }
    
    @IBAction func incomeCheckButton(_ sender: Any)
    {
        if(incomeCheckButton.isSelected)
        {
            incomeCheckButton.isSelected = false
            expenseCheckButton.isSelected = true
            expenseCheckButton.checkBox.backgroundColor = .primaryColor
            expenseCheckButton.checkBox.setImage(UIImage(systemName: "checkmark"), for: .normal)
            expenseCheckButton.checkBox.tintColor = .white
            incomeCheckButton.checkBox.backgroundColor = .gray
            incomeCheckButton.checkBox.tintColor = .gray
        }
        else
        {
            expenseCheckButton.isSelected = false
            incomeCheckButton.isSelected = true
            incomeCheckButton.checkBox.backgroundColor = .primaryColor
            incomeCheckButton.checkBox.setImage(UIImage(systemName: "checkmark"), for: .normal)
            incomeCheckButton.checkBox.tintColor = .white
            expenseCheckButton.checkBox.backgroundColor = .gray
            expenseCheckButton.checkBox.tintColor = .gray
        }
        statsCollectionView.reloadData()
        redrawChart()
    }
    
    @IBAction func expenseCheckButton(_ sender: Any)
    {
        if(expenseCheckButton.isSelected)
        {
            expenseCheckButton.isSelected = false
            incomeCheckButton.isSelected = true
            incomeCheckButton.checkBox.backgroundColor = .primaryColor
            incomeCheckButton.checkBox.setImage(UIImage(systemName: "checkmark"), for: .normal)
            incomeCheckButton.checkBox.tintColor = .white
            expenseCheckButton.checkBox.backgroundColor = .gray
            expenseCheckButton.checkBox.tintColor = .gray
        }
        else
        {
            incomeCheckButton.isSelected = false
            expenseCheckButton.isSelected = true
            expenseCheckButton.checkBox.backgroundColor = .primaryColor
            expenseCheckButton.checkBox.setImage(UIImage(systemName: "checkmark"), for: .normal)
            expenseCheckButton.checkBox.tintColor = .white
            incomeCheckButton.checkBox.backgroundColor = .gray
            incomeCheckButton.checkBox.tintColor = .gray
        }
        statsCollectionView.reloadData()
        redrawChart()
    }
}
    
extension StatsTabViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StatsCell", for: indexPath) as! StatsCell
        cell.set(text: categories[indexPath.item].name ?? "", text1: "", imageName: categories[indexPath.item].icon ?? "", imageColor: categories[indexPath.item].color ?? "",percentage: incomeCheckButton.isSelected ? String(format: "%.0f", abs(categoryIncomeSaldoArray[indexPath.item])) + "%" : String(format: "%.0f", abs(categoryExpenseSaldoArray[indexPath.item])) + "%")
            return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
                return CGSize(width: collectionView.frame.width, height: 35)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
            return 0
    }
}



    


