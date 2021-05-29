table 70001 "CW District"
{
    DataClassification = CustomerContent;
    DataPerCompany = false;
    fields
    {
        field(1; "State Id"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(2; "id"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(3; "Name"; Text[250])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "State Id", id)
        {
            Clustered = true;
        }
    }
}