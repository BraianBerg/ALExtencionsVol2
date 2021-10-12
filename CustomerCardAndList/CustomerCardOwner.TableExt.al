tableextension 50700 CustomerCardOwner extends Customer
{
    fields
    {
        field(50701; AGP_PRK_001_OwnersName; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Owners Name';
            Editable = true;
        }
        field(50702; AGP_PRK_001_OwnersIdCode; Text[11])
        {
            DataClassification = CustomerContent;
            Caption = 'Owners Id Code';
            Editable = true;

            trigger OnValidate()
            var
                RecCunit: Codeunit CopyAndCreate;
                CustomerNr: Code[20];
                RecCustomer: Record Customer;
                RecCust: Record Customer;
                StatusTrue: Label 'Id Code has been saved';
                StatusFalse: Label 'Id Code is wrong and is not saved';
            begin
                CustomerNr := Rec."No.";
                if Rec.AGP_PRK_001_OwnersIdCodeType = Rec.AGP_PRK_001_OwnersIdCodeType::"Estonian Id Code" then begin
                    if RecCunit.CheckIdCode(Rec.AGP_PRK_001_OwnersIdCode) = false then begin
                        Error(StatusFalse);
                    end
                    else begin
                        Message(StatusTrue);
                    end;
                end
                else begin
                    Message(StatusTrue);
                end;
            end;
        }
        field(50703; AGP_PRK_001_OwnersIdCodeType; Option)
        {
            DataClassification = CustomerContent;
            Caption = 'Owners Id Code Type';
            OptionMembers = "Estonian Id Code","Something else";
            OptionCaption = 'Estonian ID Code, Other Country Id code';
            Editable = true;
        }
    }
}
