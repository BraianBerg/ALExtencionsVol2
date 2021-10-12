pageextension 50700 "Company Owner" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field(OwnersName; AGP_PRK_001_OwnersName)
            {
                ApplicationArea = All;
                ToolTip = 'Is Customers compay Owner Name';
            }
            field(OwnersIdCode; AGP_PRK_001_OwnersIdCode)
            {
                ApplicationArea = All;
                ToolTip = 'Is Customer company Owner Identification Code(Estonias Id code)';
            }
            field(OwnersIdCodeType; AGP_PRK_001_OwnersIdCodeType)
            {
                ApplicationArea = All;
                ToolTip = 'Is Customer company Owner Identification Code Type';
            }
        }
    }

    actions
    {
        addafter("&Customer")
        {
            action("Export Sales Header")
            {
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction();
                begin
                    Xmlport.Run(50711, true, false);
                end;
            }
        }
    }




}
