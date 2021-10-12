pageextension 50713 CustomerList extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
    }
    actions
    {
        addafter("&Customer")
        {
            action("Make Report")
            {
                trigger OnAction()
                var
                    myInt: Integer;

                begin

                    Report.Run(Report::SalesHeaderReport);
                end;
            }

        }
    }

    /*
        trigger OnOpenPage()
        var
            myInt: Integer;
            rec: Record Customer;
        begin
            rec.Get('01121212');
            Report.Run(Report::SalesHeaderReport, true, false, rec);
        end;
    */

    var
        myInt: Integer;
}


