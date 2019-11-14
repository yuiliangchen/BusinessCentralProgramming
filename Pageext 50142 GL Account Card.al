pageextension 50142 "G/L Account Card Extension" extends "G/L Account Card"
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