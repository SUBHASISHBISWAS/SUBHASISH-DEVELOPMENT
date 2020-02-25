export interface IExpense {
  expenseId: number;
  expenseDescription: string;
  expenseAmount: number;
  expenseType: string;
  transactionDate: number;
  beneficiary: string;
  remunerator: string;
  benificiaryRating:number;
  imageUrl: string;
}
