tableextension 50701 SalesTableOwnerInfo extends "Sales Header"
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
        }
    }
}


xmlport 50711 SalesHeaderXml
{
    UseRequestPage = true;
    Format = xml;
    schema
    {
        textelement(SalesHeaderBlock)
        {
            tableelement(Sales; "Sales Header")
            {
                //SourceTableView
                XmlName = 'SalesHeader';
                RequestFilterFields = "No.";
                fieldattribute(OwnersIDCode; Sales.AGP_PRK_001_OwnersIdCode) { }
                fieldattribute(OwnersName; Sales.AGP_PRK_001_OwnersName) { }
                fieldattribute(CompanyNo; Sales."No.") { }
                fieldattribute(DocType; Sales."Document Type") { }
                fieldattribute(DocNoOccurance; Sales."Doc. No. Occurrence") { }
                fieldattribute(DocDate; Sales."Document Date") { }
                fieldattribute(DueDate; Sales."Due Date") { }

            }

        }
    }

    requestpage
    {
        SaveValues = false;
        layout
        {
            area(Content)
            {

            }
        }
        actions
        {
            area(processing)
            {
                action(Download)
                {
                    trigger OnAction()
                    var
                        myInt: Integer;
                    begin
                        Message('Arendus test');
                    end;
                }
            }
        }


    }
}