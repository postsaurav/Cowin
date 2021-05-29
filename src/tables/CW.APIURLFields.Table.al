table 60001 "CW Api Url Fields"
{
    DataClassification = CustomerContent;
    DataPerCompany = false;
    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(2; "Field No."; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(3; "Field Name"; Text[250])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Entry No.", "Field No.")
        {
            Clustered = true;
        }
    }
}