pageextension 50702 SalesOrderOwner extends "Sales Order"
{
    layout
    {
        addlast(General)
        {
            field(OwnerName;AGP_PRK_001_OwnersName)
            {
                ApplicationArea = All;
                ToolTip = 'Is Customer cards Owner Name';
            }
            field(OwnerId;AGP_PRK_001_OwnersIdCode)
            {
                ApplicationArea = All;
                ToolTip = 'Is Customer cards Owner Identification Code(Estonias Id code)';
            }
        }
    }
}
