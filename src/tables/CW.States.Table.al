table 70000 "Cw States"
{
    DataClassification = ToBeClassified;
    DataPerCompany = false;
    fields
    {
        field(1; id; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(2; Name; Text[250])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; id)
        {
            Clustered = true;
        }
    }
}