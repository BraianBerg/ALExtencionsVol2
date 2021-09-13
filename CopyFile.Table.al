table 50705 CopyFile
{
    DataClassification = CustomerContent;

    fields
    {
        field(50705;AGP_PRK_001_FileName;Text[50])
        {
            DataClassification = CustomerContent;
            Editable = true;
            Caption = 'Old File Name';
        }
        field(50706;AGP_PRK_001_NewFileName;Text[50])
        {
            DataClassification = CustomerContent;
            Editable = true;
            Caption = 'New File Name';
        }
        field(50707;AGP_PRK_001_FileType;Option)
        {
            OptionMembers = "Text File", "Word Document";
            OptionCaption = 'Text File(notepad), Microsoft Word Document';
            DataClassification = CustomerContent;
        }
    }
}
