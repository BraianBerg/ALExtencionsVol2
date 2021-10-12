page 50716 "API Country model"
{
    PageType = API;
    APIVersion = 'v1.0';
    APIPublisher = 'default';
    APIGroup = 'demo';

    EntityName = 'peopleModel';
    EntitySetName = 'peopleModels';

    ODataKeyFields = SystemId;
    SourceTable = "City";

    Extensible = false;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                    Editable = false;
                }
                field(CityName; Rec.CityName)
                {
                    Caption = 'City Name';
                }

                field(Continent; Rec.Continent)
                {
                    Caption = 'Continent';
                }

                field(Country; Rec.Country)
                {
                    Caption = 'Country Name';
                }
                part(peopleModels; "API People Model")
                {
                    Caption = 'People Model';
                    EntityName = 'peopleModel';
                    EntitySetName = 'peopleModels';
                    SubPageLink = CityName = Field(SystemId);
                }
            }
        }
    }
}