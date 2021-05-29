page 70001 "CW District"
{

    ApplicationArea = All;
    Caption = 'S District';
    PageType = ListPart;
    SourceTable = "CW District";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("State Id"; Rec."State Id")
                {
                    ToolTip = 'Specifies the value of the State Id field';
                    ApplicationArea = All;
                    Visible = false;
                }
                field(id; Rec.id)
                {
                    ToolTip = 'Specifies the value of the id field';
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field';
                    ApplicationArea = All;
                }
            }
        }
    }
}
