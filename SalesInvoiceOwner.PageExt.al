pageextension 50701 SalesInvoiceOwner extends "Sales Invoice"
{
    layout
    {
        addlast(General)
        {
            field(OwnersName;AGP_PRK_001_OwnersName)
            {
                ApplicationArea = All;
                ToolTip = 'Is Customer cards Owner Name';
            }
            field(OwnersId;AGP_PRK_001_OwnersIdCode)
            {
                ApplicationArea = All;
                ToolTip = 'Is Customer cards Owner Identification Code(Estonias Id code)';
            }
        }
    }
}
