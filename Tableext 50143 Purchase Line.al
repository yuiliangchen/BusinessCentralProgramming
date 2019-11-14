tableextension 50143 "Purchase Line Extension" extends "Purchase Line"
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