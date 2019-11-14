tableextension 50142 "G/L Entry Extension" extends "G/L Entry"
{
    fields
    {
        // Add changes to table fields here
        field(50142; "Expense Code"; Code[20])
        {
            TableRelation = Expense.Code WHERE (Disabled = CONST (false));
        }
    }

    var
        myInt: Integer;
}