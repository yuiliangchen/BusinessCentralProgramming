pageextension 50144 "Pur. Order Subform Extension" extends "Purchase Order Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter(Quantity)
        {
            field("Expense Code"; "Expense Code")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
        addlast(Processing)
        {
            action("Page Expenses")
            {
                trigger OnAction();
                begin
                    Page.Run(50141);
                end;
            }
        }
    }

    var
        myInt: Integer;
}