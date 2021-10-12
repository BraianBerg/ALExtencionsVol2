pageextension 50704 CreditMemoSalesOwner extends "Sales Credit Memo"
{
    layout
    {
        addlast(General)
        {
            field(OwnersName; AGP_PRK_001_OwnersName)
            {
                ApplicationArea = All;
                ToolTip = 'Is Customer cards Owner Name';
            }
            field(OwnersId; AGP_PRK_001_OwnersIdCode)
            {
                ApplicationArea = All;
                ToolTip = 'Is Customer cpmany Owner Identification Code(Estonias Id code)';
            }
        }
    }
}
