page 50705 Coping
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Tasks;
    SourceTable = CopyFile;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(FileName;AGP_PRK_001_FileName)
                {
                    ApplicationArea = All;
                    ToolTip = 'File that you want to copy';
                    Editable = true;
                }
                field(NewFileName;AGP_PRK_001_NewFileName)
                {
                    ApplicationArea = All;
                    ToolTip = 'File that you want to paste in';
                    Editable = true;
                }
                field(FileType;AGP_PRK_001_FileType)
                {
                    ToolTip = 'The type of file what you want to create!';
                    ApplicationArea = All;
                    Editable = true;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Copy File")
            {
                ApplicationArea = all;
                Promoted = true;
                Caption = 'Copy File';

                trigger OnAction()var CopyRec: Codeunit CopyAndCreate;
                begin
                    CopyRec.CopyFile(Rec, xRec);
                end;
            }
            action("Create File")
            {
                ApplicationArea = all;
                Promoted = true;
                Caption = 'Create File';

                trigger OnAction()var CopyRec: Codeunit CopyAndCreate;
                begin
                    CopyRec.CreateFile(Rec, xRec);
                end;
            }
        }
    }
}
