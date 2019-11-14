tableextension 50141 "G/L Account Extension" extends "G/L Account"
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