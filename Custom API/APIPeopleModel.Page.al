page 50715 "API People Model"
{
    PageType = API;
    APIVersion = 'v1.0';
    APIPublisher = 'default';
    APIGroup = 'demo';

    EntityName = 'peopleModel';
    EntitySetName = 'peopleModels';

    ODataKeyFields = SystemId;
    SourceTable = "People Data";

    Extensible = false;
    DelayedInsert = true;
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                    Editable = false;
                }
                field(Name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(FamilyName; Rec.FamilyName)
                {
                    Caption = 'Name';
                }
                field(Age; Rec.Age)
                {
                    Caption = 'Name';
                }
                field(CityName; Rec.CityName)
                {
                    Caption = 'Name';
                }
                field(HouseType; Rec.HouseType)
                {
                    Caption = 'Name';
                }
            }
        }
    }
}