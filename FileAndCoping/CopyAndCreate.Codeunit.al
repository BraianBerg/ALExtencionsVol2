codeunit 50705 CopyAndCreate
{
    //[EventSubscriber(ObjectType::Page, Codeunit::Customer c, 'OnSomeEvent', 'ElementName', false, false)]
    procedure CheckIdCode(numbers: Text[11])Return: Boolean var RecCust: Record Customer;
    Level1: array[20]of Integer;
    IDCode: array[11]of Integer;
    CalcFirstResult: Decimal;
    CalcSecondResult: Decimal;
    Controll: Decimal;
    Controll2: Decimal;
    bDate: Integer;
    bMonth: Integer;
    bYear: Integer;
    VaheNumber: Decimal;
    uusId: Text[11];
    begin
        Level1[1]:=1;
        Level1[2]:=2;
        Level1[3]:=3;
        Level1[4]:=4;
        Level1[5]:=5;
        Level1[6]:=6;
        Level1[7]:=7;
        Level1[8]:=8;
        Level1[9]:=9;
        Level1[10]:=1;
        Level1[11]:=3;
        Level1[12]:=4;
        Level1[13]:=5;
        Level1[14]:=6;
        Level1[15]:=7;
        Level1[16]:=8;
        Level1[17]:=9;
        Level1[18]:=1;
        Level1[19]:=2;
        Level1[20]:=3;
        Controll:=1;
        Controll2:=1;
        Evaluate(bYear, CopyStr(numbers, 2, 2));
        Evaluate(bMonth, CopyStr(numbers, 4, 2));
        Evaluate(bDate, CopyStr(numbers, 6, 2));
        //putting string id code in integer array
        for Controll:=1 to 11 do begin
            Evaluate(IDCode[Controll], CopyStr(numbers, Controll, 1));
        end;
        if(IDCode[1] <= 2) or (IDCode[1] >= 7)then begin
            Return:=false;
            exit(Return);
        end;
        // kontroll kas kuus on rohkem kui 31 paeva või vähem kui 00 päeva ja kas kuid on rohkem kui  00 ja vähem või võrgen 12
        if(bMonth < 01) or (bMonth > 12) or (bDate > 31) or (bDate < 01)then begin
            Return:=false;
            exit(Return);
        end;
        // kontroll nr arvutamine
        // lvl 1 calclualtion
        Controll:=1;
        for Controll:=1 to 10 do begin
            CalcFirstResult:=CalcFirstResult + (Level1[Controll] * IDCode[Controll]);
        end;
        VaheNumber:=CalcFirstResult / 11;
        VaheNumber:=VaheNumber - (VaheNumber mod 1);
        CalcSecondResult:=CalcFirstResult - (VaheNumber * 11);
        // kontroll nr  kontrill kui arvutatud nr  on suurem kui null ja väiksem kui 9
        if(CalcSecondResult <= 9) and (CalcSecondResult > 0)then begin
            if IDCode[11] = CalcSecondResult then begin
                Return:=true;
                exit(Return);
            end
            else
            begin
                Return:=false;
                exit(Return);
            end;
        end;
        // lvl 2 calcualtion
        if CalcSecondResult >= 10 then begin
            CalcFirstResult:=0;
            CalcSecondResult:=0;
            VaheNumber:=0;
            for Controll:=11 to 20 do begin
                CalcFirstResult:=CalcFirstResult + (Level1[Controll2] * IDCode[Controll]);
                Controll2+=1;
            end;
            VaheNumber:=CalcFirstResult / 11;
            VaheNumber:=VaheNumber - (VaheNumber mod 1);
            CalcSecondResult:=CalcFirstResult - (VaheNumber * 11);
            // kontroll nr kontroll kui nr on suurem võrdne 10 nega
            if(CalcSecondResult >= 10)then begin
                if IDCode[11] = 0 then begin
                    Return:=true;
                    exit(Return);
                end
                else
                begin
                    Return:=false;
                    exit(Return);
                end;
            end;
        end;
    end;
    local procedure CheckFiletype(var Rec: Record CopyFile;
    var xRec: Record CopyFile)FileType: Text[30]begin
        case Rec.AGP_PRK_001_FileType of Rec.AGP_PRK_001_FileType::"Text File": FileType:='.txt';
        Rec.AGP_PRK_001_FileType::"Word Document": FileType:='.docx';
        end;
    end;
    procedure CopyFile(var Rec: Record CopyFile;
    var xRec: Record CopyFile)var copyed: Label 'File was copyied';
    notcopyed: Label 'File was not copyed';
    begin
        if File.Copy('C:\Users\braia\Desktop\' + 'ul1praktika.txt', 'C:\Users\braia\Desktop\' + Rec.AGP_PRK_001_NewFileName + CheckFiletype(Rec, xRec))then begin
            Message(copyed);
        end
        else
        begin
            Message(notcopyed);
        end;
    end;
    procedure CreateFile(var Rec: Record CopyFile;
    var xRec: Record CopyFile)var new: File;
    filecreated: Label 'The file was Created';
    filenotcreated: Label 'The file was not created';
    begin
        if new.Create('C:\Users\braia\Desktop\' + Rec.AGP_PRK_001_NewFileName + '.txt')then Message(filecreated)
        else
            Message(filenotcreated);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Document Mgt.", 'OnAfterCopyFieldsFromOldSalesHeader', '', false, false)]
    local procedure CopyFieldsSalesHeader(var ToSalesHeader: Record "Sales Header";
    OldSalesHeader: Record "Sales Header";
    MoveNegLines: Boolean;
    IncludeHeader: Boolean)begin
        ToSalesHeader.AGP_PRK_001_OwnersName:=OldSalesHeader.AGP_PRK_001_OwnersName;
        ToSalesHeader.AGP_PRK_001_OwnersIdCode:=OldSalesHeader.AGP_PRK_001_OwnersIdCode;
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Document Mgt.", 'OnCopySalesDocOnBeforeCopySalesDocShptLine', '', false, false)]
    local procedure CopyPostedShipmentDoc(var FromSalesShipmentHeader: Record "Sales Shipment Header";
    var ToSalesHeader: Record "Sales Header")begin
        ToSalesHeader.AGP_PRK_001_OwnersName:=FromSalesShipmentHeader.AGP_PRK_001_OwnersName;
        ToSalesHeader.AGP_PRK_001_OwnersIdCode:=FromSalesShipmentHeader.AGP_PRK_001_OwnersIdCode;
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Document Mgt.", 'OnCopySalesDocOnBeforeCopySalesDocInvLine', '', false, false)]
    local procedure CopyPostedSalesInvoice(var FromSalesInvoiceHeader: Record "Sales Invoice Header";
    var ToSalesHeader: Record "Sales Header")begin
        ToSalesHeader.AGP_PRK_001_OwnersName:=FromSalesInvoiceHeader.AGP_PRK_001_OwnersName;
        ToSalesHeader.AGP_PRK_001_OwnersIdCode:=FromSalesInvoiceHeader.AGP_PRK_001_OwnersIdCode;
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Document Mgt.", 'OnCopySalesDocOnBeforeCopySalesDocCrMemoLine', '', false, false)]
    local procedure CopyPostedCreditMemo(var FromSalesCrMemoHeader: Record "Sales Cr.Memo Header";
    var ToSalesHeader: Record "Sales Header")begin
        ToSalesHeader.AGP_PRK_001_OwnersName:=FromSalesCrMemoHeader.AGP_PRK_001_OwnersName;
        ToSalesHeader.AGP_PRK_001_OwnersIdCode:=FromSalesCrMemoHeader.AGP_PRK_001_OwnersIdCode;
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Document Mgt.", 'OnCopySalesDocOnBeforeCopySalesDocReturnRcptLine', '', false, false)]
    local procedure MyProcedure(var FromReturnReceiptHeader: Record "Return Receipt Header";
    var ToSalesHeader: Record "Sales Header")begin
        ToSalesHeader.AGP_PRK_001_OwnersName:=FromReturnReceiptHeader.AGP_PRK_001_OwnersName;
        ToSalesHeader.AGP_PRK_001_OwnersIdCode:=FromReturnReceiptHeader.AGP_PRK_001_OwnersIdCode;
    end;
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterValidateEvent', 'Sell-to Customer Name', false, false)]
    procedure PutOwnerInfoInToSalesHeader(var Rec: Record "Sales Header";
    var xRec: Record "Sales Header";
    CurrFieldNo: Integer)var notfound: Label 'record was not found';
    RecCust: Record Customer;
    begin
        IF RecCust.GET(Rec."Sell-to Customer No.")THEN begin
            Rec.Validate(AGP_PRK_001_OwnersName, RecCust.AGP_PRK_001_OwnersName);
            Rec.Validate(AGP_PRK_001_OwnersIdCode, RecCust.AGP_PRK_001_OwnersIdCode);
        end
        else
            Message(notfound);
    end;
}
