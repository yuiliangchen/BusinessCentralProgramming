tableextension 50144 "Invoice Post. Buffer Extension" extends "Invoice Post. Buffer"
{
    fields
    {
        // Add changes to table fields here
        field(50141; "Expense Code"; Code[20])
        {
            TableRelation = Expense.Code WHERE (Disabled = CONST (false));
        }
    }

    var
        myInt: Integer;
}