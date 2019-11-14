pageextension 50141 "Chart of Accounts Extension" extends "Chart of Accounts"
{
    layout
    {
        // Add changes to page layout here
        addafter(Balance)
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