table 60000 "CW Api Url"
{
    DataClassification = CustomerContent;
    DataPerCompany = false;
    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(2; "URL"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(3; "URL Keys"; Text[250])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

}