report 50712 SalesHeaderReport
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'MyRDLReport.rdl';
    //DefaultLayout = Word;
    //WordLayout = 'MyWordReport.docx';

    dataset
    {
        dataitem(Sales; "Sales Header")
        {
            column(OwnersIdCode; Sales.AGP_PRK_001_OwnersIdCode)
            {
                IncludeCaption = true;
            }
            column(OwnersName; Sales.AGP_PRK_001_OwnersName)
            {
                IncludeCaption = true;
            }
            column(companyNo; Sales."No.")
            {
                // IncludeCaption = true;
            }
            column(Due_Date; Sales."Due Date")
            {
                IncludeCaption = true;
            }
            column(Doc__No__Occurrence; Sales."Doc. No. Occurrence")
            {
                IncludeCaption = true;
            }
            column(Document_Type; Sales."Document Type")
            {
                IncludeCaption = true;
            }
            column(Document_Date; Sales."Document Date")
            {
                IncludeCaption = true;
            }
            column(Barcode; EncodedText)
            {

            }
            column(DateCreated; TestDateTime)
            {

            }

            trigger OnAfterGetRecord()
            var

                BarcodeSymbology: Enum "Barcode Symbology";
                IBarcodeFontProvider: Interface "Barcode Font Provider";

            begin
                TestDateTime := CurrentDateTime;
                IBarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;
                BarcodeSymbology := Enum::"Barcode Symbology"::"EAN-13";
                EncodedText := IBarcodeFontProvider.EncodeFont('Cronus Special', BarcodeSymbology);
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    //field(Name; SourceExpression){ApplicationArea = All}
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }

    }
    var
        EncodedText: Text;
        TestDateTime: DateTime;
}