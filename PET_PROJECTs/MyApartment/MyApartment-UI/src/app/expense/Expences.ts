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

export interface IBeneficiary {
  firstName: string;
  lastName: string;
  address: string;
}
export interface IRemunerator {
  firstName: string;
  lastName: string;
  address: string;
}

