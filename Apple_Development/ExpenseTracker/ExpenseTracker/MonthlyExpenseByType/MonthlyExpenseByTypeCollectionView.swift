//
//  YearlyExpenseViewController.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 06/01/21.
//

import UIKit

class MonthlyExpenseByTypeCollectionView: UIViewController {

    @IBOutlet weak var expenceCollectionView: UICollectionView!
    var transactionDate : Date?
    var expenseByTypeByMonthSource : ExpenseCollectionViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ExpenseByTypeManger.GetExpenseOfAllTypeByMonth( completion: { [weak self] (ExpenseByTypeModels) in
            guard let self = self else { return }
            
            self.expenseByTypeByMonthSource = ExpenseCollectionViewDataSource(expenseCollectionViewDataProvider: ExpenseByTypeByMonthDataProvider(expenseByTypes:ExpenseByTypeModels))
            self.expenceCollectionView.dataSource = self.expenseByTypeByMonthSource
            self.expenceCollectionView.delegate = self.expenseByTypeByMonthSource
            self.expenceCollectionView.reloadData()
        },transactionDate: transactionDate! )
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
    expenceCollectionView.reloadData()
    }
}