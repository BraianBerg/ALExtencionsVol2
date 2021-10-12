table 50715 "People Data"
{
    DataClassification = CustomerContent;
    Caption = 'People data from speciffic city';
    fields
    {
        field(103; Name; Text[100])
        {
            Caption = 'First Name';
        }

        field(104; FamilyName; Text[100])
        {
            Caption = 'Family name';
        }

        field(105; Age; Integer)
        {
            Caption = 'Age';
        }

        field(106; CityName; Guid)
        {
            TableRelation = "City".SystemId;
            Caption = 'Corresponding city name';
        }
        field(107; HouseType; Enum "House Type")
        {
            Caption = 'Type of building you life in';
        }
    }
    keys
    {
        key(PK; CityName)
        {
            Clustered = true;
        }
    }
}

enum 50700 "House Type"
{
    Extensible = true;

    value(0; House)
    {
    }
    value(1; Appartment)
    {
    }
    value(2; Garage)
    {
    }
}