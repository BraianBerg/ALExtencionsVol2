table 50714 "City"
{
    DataClassification = CustomerContent;
    Caption = 'City Data';

    fields
    {
        field(100; CityName; Text[100])
        {
            Caption = 'City name';
        }
        field(101; Continent; Text[100])
        {
            Caption = 'Continent';
        }
        field(102; Country; Text[100])
        {
            Caption = 'Country';
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