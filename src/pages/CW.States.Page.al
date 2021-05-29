page 70000 "CW States"
{
    ApplicationArea = All;
    Caption = 'States';
    PageType = List;
    SourceTable = "Cw States";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
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
        area(FactBoxes)
        {
            part(Districts; "CW District")
            {
                Caption = 'District';
                ApplicationArea = All;
                SubPageLink = "State Id" = field(id);
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(FetchStates)
            {
                ApplicationArea = All;
                Caption = 'Get States';
                Image = GetLines;
                ToolTip = 'Get States From Cowin WebSite.';
                trigger OnAction()
                var
                    CowinReader: Codeunit "CW Api Reader";
                begin
                    CowinReader.ReadAllStates();
                end;
            }
            action(FetchDistrict)
            {
                ApplicationArea = All;
                Caption = 'Get District';
                Image = GetLines;
                ToolTip = 'Get District From Cowin WebSite.';
                trigger OnAction()
                var
                    CowinReader: Codeunit "CW Api Reader";
                begin
                    CowinReader.ReadAllDistrict();
                end;
            }
        }
    }
}
